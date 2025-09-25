# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=libnick
pkgver=2025.9.4
_maddyver=1.5.0
pkgrel=1
pkgdesc="A cross-platform base for native Nickvision applications"
arch=('x86_64')
url="https://github.com/NickvisionApps/libnick"
license=('MIT')
makedepends=('boost' 'cmake' 'cpr' 'libmaddy' 'sqlcipher')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3071fdfba3f3d444a8d5fc41e5fe1babd3f38d3c3c798b49d095f2815c7608dc')

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
