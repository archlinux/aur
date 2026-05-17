#!/bin/bash
# Maintainer: Holger Schramm <dev@strace.it>
pkgname=apidog-eu-bin
pkgver=2.8.29
pkgrel=1
pkgdesc="Design. Debug. Test. Document. Mock. Build APIs Faster & Together. (EU Version)"
provides=('apidog-eu')
conflicts=('apidog')
arch=('x86_64')
url="https://apidog.com"
options=(!strip)
license=('custom')
depends=(nss libx11 gtk3 libxcb java-runtime alsa-lib lib32-glibc nodejs lib32-gcc-libs libdbusmenu-glib)
source_x86_64=(
	"Apidog Europe-${pkgver}.AppImage::https://file-assets.eu.apidog.com/download/${pkgver}/Apidog%20Europe-${pkgver}.AppImage"
	"apidog-eu.desktop"
)
sha256sums_x86_64=('acf607424933976e585a31628f2d099c823b58a39ba4251cf97af8ccb2765df6'
                   'a568c806ae77f3e7858c07ab095309bdcc2f87a71a49bad7e853bc140d30dbeb')

package() {
    chmod +x "Apidog Europe-${pkgver}.AppImage"
    ./Apidog\ Europe-${pkgver}.AppImage --appimage-extract
    install -dm755 "${pkgdir}/opt/"

    cp -r "squashfs-root" "${pkgdir}/opt/apidog-eu"
    chmod -R 755 "${pkgdir}/opt/apidog-eu"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/apidog-eu/apidog" "${pkgdir}/usr/bin/apidog-eu"

    install -D -m644 "apidog-eu.desktop" \
        "${pkgdir}/usr/share/applications/apidog-eu.desktop"

    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${pkgdir}/opt/apidog-eu/apidog-eu.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/apidog-eu.png"
}
