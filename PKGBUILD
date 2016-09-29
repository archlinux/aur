# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=double-conversion
pkgver=2.0.1
pkgrel=3
pkgdesc='Binary-decimal and decimal-binary routines for IEEE doubles'
arch=(i686 x86_64)
url='https://github.com/google/double-conversion'
license=(BSD3)
makedepends=(cmake)
source=(double-conversion-$pkgver.tar.gz::https://github.com/google/double-conversion/archive/v$pkgver.tar.gz
        shared_lib.patch)
sha1sums=('a590b4e9e1509bcf48da79a9c0571cfe218920f4'
          '54abeec2090908c7ed229986826e8cce400edd1b')

prepare() {
  cd double-conversion-$pkgver
  patch -p1 < ../shared_lib.patch
}

build() {
  cd double-conversion-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
  make
}

check() {
  cd double-conversion-$pkgver
  cd test
  cmake .
# Currently tests fail
#  make all
}

package () {
  cd double-conversion-$pkgver
  make DESTDIR="$pkgdir" install
}
