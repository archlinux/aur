# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=libnick
pkgver=2025.6.1
_maddyver=1.5.0
pkgrel=1
pkgdesc="A cross-platform base for native Nickvision applications"
arch=('x86_64')
url="https://github.com/NickvisionApps/libnick"
license=('MIT')
makedepends=('boost' 'cmake')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "maddy-${_maddyver}.zip::https://github.com/progsource/maddy/releases/download/${_maddyver}/maddy-src.zip")
sha256sums=('424e747731e7dc0ecfa599b8be9781b6951d0ba13596a82fd885cb161b2fa9dc'
            'eae8990ab796185547ef06dbb752d0d7cbc38067b327a4c7e5141c280aa633fd')

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
