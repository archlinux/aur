# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=wdm
pkgname=lib${_base}
pkgver=0.3.2
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=(any)
url="https://github.com/tnagler/${_base}"
license=(MIT)
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c93fd94c77d56d9c8060638086dd0d563c83740b5412f312fdd180853dec6e941314d3009d62df001d5b971b75f8d8b6bd573f4604d36f520511615068f1dbe')

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
