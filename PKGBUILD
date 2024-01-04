# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uARMSolver
pkgname=${_base,,}
pkgver=0.2.6
pkgrel=1
pkgdesc="Universal Association Rule Mining Solver"
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
arch=(any)
# depends=()
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ead2ed00c99b1aa11703a2862f9fc5ccb9f4fe3940ceb6890bd9e051ffcf6a5fde6e6d159eec63611d630bf70b75e8d66a73bf5d2ccf10865a4abb0e6672c7df')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  install -Dvm755 "build/${_base}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${_base}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${_base}-${pkgver}/${_base}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 "${_base}-${pkgver}/bin/README.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
