# Maintainer: Tom Meyers <tom at odex dot be>
# Maintainer: Archttila <linux.alucard@gmail.com>

pkgname=tidal-hifi-appimage
pkgver=5.10.0
pkgrel=1
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine"
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
options=(!strip)

_appimage="tidal-hifi-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.AppImage"
        "tidal-hifi.desktop"
        "icon.png")
sha512sums=('ebcaac410a1de0142c38d84c5a540e6f350e3e7c0b7a7584f9665974234bc6f2bfd378f1410f77c18346a90e908fed4de1cd58eeb8d4ccb4e9d8fcbac6903ed7'
            'db5554ede1f14a65dba8ed151031e51e446fb7da2d0660eea74103ba94d43bc00f9c678b0169d835926bdb290f36b7d64f1b89c4dabbe6450a33dc0fd1a11a24'
            '1dff6b10027e6b430e60288950c5eb75427f582f534d3d7d349ad79fd2a592ac98921537ecca47edd4f73ae46ffdbc51be20ce0d4c67ce2f276fc07e8dfe4b18')
noextract=("${_appimage}")

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/tidal/${_appimage}"
	
    # The desktop file
    install -Dm 644 "${srcdir}/tidal-hifi.desktop" "${pkgdir}/usr/share/applications/tidal-hifi.desktop"

    # Support for the tidal icon
    install -Dm 644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/tidal-hifi.png"

    # Setup symlinks
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/tidal/${_appimage}" "${pkgdir}/usr/bin/tidal-hifi"
}
