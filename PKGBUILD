# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=wdm
pkgname=lib${_base}
pkgver=0.2.4
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=(any)
url="https://github.com/tnagler/${_base}"
license=(MIT)
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5d860025ccb8014f039d4e8aa07834b35c28f1c47164a6e346a3f8d24907e472a1bbec60fc1eb14cd042beaa6b08d58c988299913270116beaa44e657d3fd5b9')

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
