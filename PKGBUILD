# Maintainer: badcast <lmecomposer@gmail.com>

pkgname=library-brainmap
pkgver=1.1.0
pkgrel=1
pkgdesc="Brain Neuron Map - for Generate Maze and Path-Finder interface with ULTRA fast"
arch=('x86_64')
url="https://github.com/badcast/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee5e3564e02fe615400c9c315b35eee8bed10bedba43377792348d8a6f39e4d7')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
