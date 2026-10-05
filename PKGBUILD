# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=tabulate
pkgver=2.1
pkgrel=1
pkgdesc="Table maker for modern C++"
arch=(x86_64)
url="https://github.com/p-ranav/${pkgname}"
license=(MIT)
depends=()
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d91d3bcb6946660f3b5493d51d7170ad19bbcf837cfae69a43cbe870284f65f751f347632fa16b341cf4ca99745afd5acb90bf496f85c32d037e0c0e1d316700')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
