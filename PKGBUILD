# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=wdm
pkgname=lib${_base}
pkgver=0.3.0
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=(any)
url="https://github.com/tnagler/${_base}"
license=(MIT)
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cf3c36ab125cdaa3fe6a8995eca7202ce3201318adb4c3460db85f86fa8287b13e7b173bafc7863ec2319a4f6a49070c71c705314fb564dbc69adcef67d81149')

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
