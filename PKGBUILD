# Maintainer: seird <k.dries@protonmail.com>
_pkgname=gotify-tray-cpp
pkgname=${_pkgname}
pkgver=0.1.4
pkgrel=1
pkgdesc="A tray notification application for receiving messages from a Gotify server."
arch=('x86_64')
url='https://github.com/seird/gotify-tray-cpp'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-websockets' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'knotifications')
makedepends=('git' 'cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/seird/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8816baaf990ecf7e890478261dac89bd8f3174faf9a48510c6d6d3923dcc2b69')

build() {
    cd "${_pkgname}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE=Release .
    make -j $(nproc)
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -D -m755 gotify-tray++ "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 desktop/${_pkgname}.desktop "${pkgdir}/usr/share/applications/Gotify-Tray++.desktop"
    install -D -m644 "res/icons/tray.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
