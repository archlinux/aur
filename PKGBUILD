# Maintainer: Pellegrino Prevete <pellegrinoprevete (at) gmail (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mce-dev
pkgver=1.28.3
pkgrel=1
pkgdesc="Headers defining the D-Bus method calls provided by the Mode Control Entity"
arch=('any')
url="https://git.sailfishos.org/mer-core/mce-dev"
license=('LGPL2.1')
makedepends=('doxygen')
conflicts=('mce-headers')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/mce-dev-$pkgver.tar.gz")
sha512sums=('a244567d905713d9065fc95ce5e91a5b6895516a944c42acbd2df0dd428e74343f8ba750f4e4388798b7bf924d7d87db2352e065942e7abb45214e23d2dfb67e')

prepare() {
  ls
  cd "$pkgname-$pkgver"
  # Upstream uses dpkg-parsechangelog
  sed -i 's|VERSION=$(.*)|VERSION='$pkgver'|' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/doc/mce-doc/html/
}
