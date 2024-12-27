# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=wdm
pkgname=lib${_base}
pkgver=0.2.5
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=(any)
url="https://github.com/tnagler/${_base}"
license=(MIT)
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a8b81c36f136759005b764aca650d862b77999fcd3a7e00390f1b4f8ee12a08f5f7aacc6984a1a2cccc73ec376060aae1fc8bdca8762abd5a41161d3a550e98a')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DBUILD_TESTING=OFF \
    -DCODE_COVERAGE=OFF \
    -DOPT_ASAN=OFF \
    -DWARNINGS_AS_ERRORS=OFF \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 "${_base}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
