# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mce-dev
pkgver=1.8.21
pkgrel=1
pkgdesc="Headers defining the D-Bus method calls provided by the Mode Control Entity"
arch=('any')
url="https://github.com/maemo-leste/mce-dev"
license=('LGPL2.1')
makedepends=('doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ae52169a1120bf4c970d854e7b6a13bf36e17d1b5a897e529f9117cec351a9564753b8d83204479bc04912fc49357e6af01777910a4f99319a56dec6f726f962')

prepare() {
  cd "$pkgname-$pkgver"
  # Upstream uses dpkg-parsechangelog
  sed -i 's|VERSION=$(.*)|VERSION='$pkgver'|' Makefile
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/doc/mce-doc/html/
  install -m 644 doc/html/* $pkgdir/usr/share/doc/mce-doc/html/
}
