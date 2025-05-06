# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=qlementine
pkgver=1.2.2
pkgrel=1
pkgdesc="Modern QStyle for desktop Qt6 applications"
arch=('x86_64')
url="https://github.com/oclero/qlementine"
license=('MIT')
makedepends=('cmake' 'qt6-base' 'qt6-svg')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff81a868e684dcb0fc405894993a3c27af73d9abb6fe6598b6548337a1662120')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
