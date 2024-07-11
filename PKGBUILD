# Maintainer: seird <k.dries@protonmail.com>
pkgname=gotify-tray-cpp
pkgver=0.0.5
pkgrel=1
pkgdesc="A tray notification application for receiving messages from a Gotify server."
arch=('x86_64')
url='https://github.com/seird/gotify-tray-cpp'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-websockets' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/seird/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1d6caecd98f7f6533ba413c12604831bd63be6f3bb3d22f74a9276a9683ae96a')

build() {
    cd "${pkgname}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m755 gotify-tray++ "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 desktop/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "res/icons/tray.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"
}
