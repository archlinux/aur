# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=skalibs-musl
pkgver=2.10.0.0
pkgrel=1
pkgdesc="A set of general-purpose C programming libraries"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs"
license=('custom:ISC')
makedepends=(musl)
provides=(skalibs=2.10.0.0)
replaces=(skalibs)
conflicts=(skalibs)
options=('staticlibs')
changelog=CHANGELOG
source=(${url}/skalibs-$pkgver.tar.gz)
sha256sums=('c1acf81f47cad74174e18fe85b6b6d16bde11093f50ce99ad35c19d8d78d5d88')

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
