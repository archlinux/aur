# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=wdm
pkgname=lib${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=(any)
url="https://github.com/tnagler/${_base}"
license=(MIT)
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('68f88af46e2a66edfffcfdbcaccc8ca1e91014d94d4bf19f9224d8c1046a0233fe371488cbb78e636e5b1b12980553a885933eaf8253a044e4aa2842be23f80c')

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
