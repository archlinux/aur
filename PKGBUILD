# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uARMSolver
pkgname=${_base,,}
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal Association Rule Mining Solver"
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
arch=(any)
# depends=()
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5e13f8133bee1e702f5a841f4ecf6b40e14d826a09dc25a2bb188dfc9d361b56f010c68b6b0ad8bf8571fe3397331b33a9af7d5299c8a004f5edcec1514c4304')

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
