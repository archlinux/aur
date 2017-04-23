# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=json-fortran
pkgver=5.3.0
pkgrel=1
pkgdesc="A Fortran 2008 JSON API"
arch=(any)
url="https://github.com/jacobwilliams/json-fortran"
license=('GPL')
depends=('gcc-fortran')
makedepends=('cmake')
source=(https://github.com/jacobwilliams/$pkgname/archive/$pkgver.tar.gz)
md5sums=('38840f7d8de08e5b0f402713d803470c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_GNU_INSTALL_CONVENTION=TRUE \
    -DSKIP_DOC_GEN=TRUE \
    -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
  cd build
  make check
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
