# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=blasfeo-git
pkgver=r1963.f3a8a00
pkgdesc="Basic linear algebra subroutines for embedded optimization"
url='https://github.com/giaf/blasfeo'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=()
provides=('blasfeo')
conflicts=('blasfeo')
_pkgname=blasfeo
source=("${_pkgname}::git+https://github.com/giaf/blasfeo")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p ${srcdir}/${_pkgname}/build
  cd ${srcdir}/${_pkgname}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
