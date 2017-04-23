# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=json-fortran-git
_pkgname=json-fortran
pkgver=r674.b37fb998
pkgrel=1
pkgdesc="A Fortran 2008 JSON API"
arch=(any)
url="https://github.com/jacobwilliams/json-fortran"
license=('GPL')
depends=('gcc-fortran')
makedepends=('git' 'cmake')
source=('git://github.com/jacobwilliams/json-fortran.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/json-fortran"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/$_pkgname" \
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
