# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=libnick
pkgver=2025.3.4
pkgrel=1
pkgdesc="A cross-platform base for native Nickvision applications"
arch=('x86_64')
url="https://github.com/NickvisionApps/libnick"
license=('MIT')
makedepends=('boost' 'cmake')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/progsource/maddy/releases/download/1.3.0/maddy-src.zip")
sha256sums=('349a6e0852b23d076fd888a3179f227206d64b0c24a075447427f0150bd2f0d7'
            '7fb55af73d298a1f49ec939ac01cec35baebe74d2776ce2f91256c1f8187106b')

prepare() {
    mv include/maddy "${pkgname}-${pkgver}/include"
}

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
