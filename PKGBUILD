# Maintainer: Tom Meyers <tom at odex dot be>
# Maintainer: Archttila <linux.alucard@gmail.com>
# Contributor: Rick van Lieshout <info at rickvanlieshout dot com>

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
sha512sums=('43870c77aa6714df0708b231bfcc3c7f84bc2f1145f8d2eaa7eaf2e76a35cbcff08f08336d0f9cf0283fd27a1ebc0dbb15e7791094a26671aa84a86e36230231'
            '30340be419d4e0b4662a2f9974626b1b11d516e2ad605b9b0d863b3a8822dc8fc2dace12087822443ff67689c64d0341ca2712b1b0d909102a50e17565308a1f'
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
