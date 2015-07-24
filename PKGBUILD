# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=chemkit
pkgname="${_pkgname}-git"
pkgver=1101
pkgrel=1
pkgdesc="An open source software library for cheminformatics, molecular 
modeling and molecular visualization"
arch=("i686" "x86_64")
url="http://www.chemkit.org/"
license=("BSD")
depends=("qt4" "boost-libs" "glu")
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
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCHEMKIT_BUILD_DEMOS=OFF \
      -DCHEMKIT_BUILD_EXAMPLES=OFF \
      -DCHEMKIT_BUILD_TESTS=OFF \
      .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
