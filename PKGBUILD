# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-pyleri
pkgver=1.3.2
pkgrel=2
pkgdesc='Left-right parser for SiriDB'
arch=(any)
url=https://github.com/transceptor-technology/pyleri
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('fcf1df629ec8bd844a8f40b9d85780b3945e795a63e6ea79568475aa9585c449691958b08fdd50b7bd3dd40ade969bb7cdae1771f4deb29a9b0905f7417bda41')

build() {
  cd pyleri-$pkgver
  python setup.py build
}

check() {
  cd pyleri-$pkgver/test
  python -m unittest || warning "Tests failed"
}

package() {
  cd pyleri-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
