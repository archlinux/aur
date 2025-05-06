# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=qlementine-icons
pkgver=1.8.1
pkgrel=1
pkgdesc="Modern icon set for desktop Qt applications"
arch=('x86_64')
url="https://github.com/oclero/qlementine-icons"
license=('MIT')
makedepends=('cmake' 'qt6-base' 'qt6-svg')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('81f4e98364cae0a07205a89d4bb218d1e6774c887a2692ee0104a82c8e2988cd')

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
