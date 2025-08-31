# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=libnick
pkgver=2025.8.0
_maddyver=1.5.0
pkgrel=1
pkgdesc="A cross-platform base for native Nickvision applications"
arch=('x86_64')
url="https://github.com/NickvisionApps/libnick"
license=('MIT')
makedepends=('boost' 'cmake' 'cpr' 'libmaddy' 'sqlcipher')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b4bac255257de9877f8a243729d3aea30259dea36d505237ee6150b1b826e0e7')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
