# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=chemkit-builder
pkgname="${_pkgname}-git"
pkgver=6
pkgrel=1
pkgdesc="Lightweight molecular editor built using chemkit"
arch=("i686" "x86_64")
url="http://www.chemkit.org/"
license=("BSD")
depends=("qt4" "boost-libs" "glu" "chemkit")
makedepends=("git" "cmake" "eigen3" "boost")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/kylelutz/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git rev-list --count HEAD
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
