# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=json-fortran-git
pkgver=r577.efac226
pkgrel=1
pkgdesc="A Fortran 2008 JSON API"
arch=(any)
url="https://github.com/jacobwilliams/json-fortran"
license=('GPL')
makedepends=('git' 'cmake')
source=('git://github.com/jacobwilliams/json-fortran.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/json-fortran"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
  cd build
  cmake "$srcdir/json-fortran" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_GNU_INSTALL_CONVENTION=TRUE -DSKIP_DOC_GEN=TRUE
}

check() {
  cd build
  make check
}

build() {
  cd build
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
