# Maintainer: Tiago Silva <tiagolsilva14 at gmail dot com>
pkgname=discord-drawing-rpc
pkgver=1.1.1
pkgrel=1
pkgdesc="Share your drawing activity on Discord through Rich Presence"
arch=('x86_64')
url="https://github.com/TheGameratorT/discord-drawing-rpc"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVERSION_TAG=${pkgver} \
        -GNinja
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    
    # Install license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
