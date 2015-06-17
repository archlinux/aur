# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=skalibs-musl
pkgver=2.2.1.0
pkgrel=1
pkgdesc="A set of general-purpose C programming libraries"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs"
license=('custom:ISC')
makedepends=(musl)
provides=(skalibs=2.2.1.0)
options=('staticlibs')
changelog=CHANGELOG
source=(${url}/skalibs-$pkgver.tar.gz)
sha256sums=('9e80ba0ee95a1f28d7e5769957699e574962e8897140c63ab87f4ed60a82e253')

build() {
  cd "$srcdir/skalibs-$pkgver"

  CC="musl-gcc" ./configure --disable-shared
  make
}

package() {
  cd "$srcdir/skalibs-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
