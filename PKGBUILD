# Maintainer: seird <k.dries@protonmail.com>
_pkgname=gotify-tray-cpp
pkgname=${_pkgname}
pkgver=0.0.12
pkgrel=1
pkgdesc="A tray notification application for receiving messages from a Gotify server."
arch=('x86_64')
url='https://github.com/seird/gotify-tray-cpp'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-websockets' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'knotifications')
makedepends=('git' 'cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/seird/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('94c162f4d4541777118aa93dbfed6377dcd24debeebce35c43eb5bb4aaf13188')

build() {
    cd "${_pkgname}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -D -m755 gotify-tray++ "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 desktop/${_pkgname}.desktop "${pkgdir}/usr/share/applications/Gotify Tray++.desktop"
    install -D -m644 "res/icons/tray.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
