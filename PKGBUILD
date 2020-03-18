# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hpipm-git
pkgver=r1098.de1a8c7
pkgrel=1
pkgdesc="High-performance interior-point-method QP solvers"
url='https://github.com/giaf/hpipm'
arch=('i686' 'x86_64')
license=('BSD 2-Clause')
makedepends=('cmake')
depends=('blasfeo')
provides=('hpipm')
conflicts=('hpipm')
_pkgname=hpipm
source=("${_pkgname}::git+https://github.com/giaf/hpipm")
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
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
