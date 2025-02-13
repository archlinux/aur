# Maintainer: seird <k.dries@protonmail.com>
_pkgname=gotify-tray-cpp
pkgname=${_pkgname}
pkgver=0.0.9
pkgrel=1
pkgdesc="A tray notification application for receiving messages from a Gotify server."
arch=('x86_64')
url='https://github.com/seird/gotify-tray-cpp'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-websockets' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'knotifications')
makedepends=('git' 'cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/seird/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('769d9f9815ad71fddedf58d48f87bb6cab729479e1e4b2ea5316dc614349a625')

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
