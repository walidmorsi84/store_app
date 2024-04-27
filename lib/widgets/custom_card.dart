import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            shadowColor: Colors.grey.withOpacity(0.3),
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(product.title.substring(0, 6),
                      style: const TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$ ' '${product.price.toString()}'),
                      const Icon(Icons.favorite, color: Colors.red)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: -40,
            child: Image.network(
              product.image,
              width: 110,
              height: 110,
            ),
          ),
        ],
      ),
    );
  }
}
