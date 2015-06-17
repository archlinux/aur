# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libcintelhex-git
pkgver=r150.0679008
pkgrel=1
pkgdesc='A C library for parsing Intel HEX files'
arch=(i686 x86_64)
url='https://github.com/martin-helmich/libcintelhex'
license=(GPL3)
makedepends=(git)
checkdepends=(cunit)
source=(git://github.com/martin-helmich/libcintelhex)
sha1sums=('SKIP')

pkgver() {
  cd libcintelhex
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd libcintelhex
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure --prefix=/usr
  CCFLAGS="$CFLAGS" make
}

check() {
  cd libcintelhex
  make check
}

package() {
  cd libcintelhex
  make install DESTDIR="$pkgdir"
}

