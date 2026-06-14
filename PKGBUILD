#!/bin/bash
# Maintainer: Alexandre Andrade <alex.andrade@alexandrade.me>
pkgname=apidog-bin
pkgver=2.8.33
pkgrel=1
pkgdesc="Design. Debug. Test. Document. Mock.Build APIs Faster & Together."
provides=('apidog')
arch=('x86_64')
url="https://apidog.com"
options=(!strip)
license=('custom')
depends=(nss libx11 gtk3 libxcb java-runtime alsa-lib lib32-glibc nodejs lib32-gcc-libs libdbusmenu-glib)
source_x86_64=(
	"Apidog-${pkgver}.AppImage::https://file-assets.apidog.com/download/${pkgver}/Apidog-${pkgver}.AppImage"
	"apidog.desktop"
)

package() {
    # Application
    chmod +x Apidog-${pkgver}.AppImage
    ./Apidog-${pkgver}.AppImage --appimage-extract
    install -dm755 "${pkgdir}/opt/"
    cp -r "squashfs-root" "${pkgdir}/opt/apidog"
    chmod -R 755 "${pkgdir}/opt/apidog"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/apidog/apidog" "${pkgdir}/usr/bin/apidog"
    
    # Desktop file
    install -D -m644 "apidog.desktop" \
        "${pkgdir}/usr/share/applications/apidog.desktop"
    
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${pkgdir}/opt/apidog/apidog.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/apidog.png"
}

sha256sums_x86_64=('4629a5ccf9080059ac4e0b52068719cb88364b7782bc6abfafdf77bb41a38ffe'
                   'df7ead28acf1b9ed171b08c4db34efbe0d1689bce594ccc68408e75af9cb8bc5')
