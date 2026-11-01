# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=asl
pkgname=ampl-${_base}
pkgver=1.0.2
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(BSD-3-Clause)
depends=(openmp)
makedepends=(cmake git)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cd4092f6ff4852ecefbbc803bf0c23cc86529fddd8159084c7a45ebf3a542c24f497d8c0457e7fac8aa21b192b0ab3eca1ab9517e68832e028e052ed25a9ed22')

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
