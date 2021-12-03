# Maintainer: Tom Meyers <tom at odex dot be>
# Contributor: Rick van Lieshout <info at rickvanlieshout dot com>

pkgname=tidal-hifi-appimage
pkgver=2.4.0
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
options=(!strip)

_appimage="tidal-hifi-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.AppImage"
        "tidal-hifi.desktop"
        "icon.png")
sha512sums=('4cf0eff0610b972b5e9e813a147af68e1f652935ccafb3639aaefcc0afd55a17014ecb913f6d0206caab8365c754de25805d1e1ae91d4760775ce537ab8c127a'
            '67326d5c69b2ffdc14bcc5eb7ad47c6518d5f9084a4784a2fcbe00bbe24e308d233401b63f2dd9b523fa6e0ae6bdfb0e89e7068afbb3e9565ecf4459900efd5a'
            '14fd15b07a96ea53116dc1018502aa7b4ff39cf62b1594483e5ff3c9d6499d0f70329fbc41dd915726ea21900021b581442e6b326d4a70b4169f4c5d9c3b6f46')
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
