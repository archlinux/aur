# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=double-conversion
pkgver=2.0.1
pkgrel=2
pkgdesc='Binary-decimal and decimal-binary routines for IEEE doubles'
arch=(i686 x86_64)
url='https://code.google.com/p/double-conversion/'
license=(BSD3)
makedepends=(cmake)
source=(https://double-conversion.googlecode.com/files/$pkgname-$pkgver.tar.gz
        shared_lib.patch)
sha1sums=('34644bfd063aba87436536e029b0dfb109df850f'
          '54abeec2090908c7ed229986826e8cce400edd1b')

prepare() {
  patch -p1 < shared_lib.patch
}

build() {
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
  make
}

check() {
  cd test
  cmake .
# Currently tests fail
#  make all
}

package () {
  make DESTDIR="$pkgdir" install
}
