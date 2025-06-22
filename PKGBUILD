# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=asl
pkgname=ampl-${_base}
pkgver=1.0.1
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(BSD-3-Clause)
depends=(openmp)
makedepends=(cmake git)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0510794489dd9e8404c4b5240ffabbca5a1a6112678c80443421f040893edbd23925b3c8fa7e3e4a9e41aeb2d7555fa747aa2070e7b1bd31da177c7aa8969211')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
