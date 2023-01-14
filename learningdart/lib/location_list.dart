import 'package:flutter/material.dart';
import 'models/location.dart';
import 'location_detail.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locations to visit in Japan"),
      ),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: _itemThumbnail(this.locations[index]),
            title: _itemTitle(this.locations[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder:(context) =>
                LocationDetail(this.locations[index]),
              ));
            },
          );
        },
      ),
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(
        location.url,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
    );
  }
}
