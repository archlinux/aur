# Maintainer: Tom Meyers <tom at odex dot be>
# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=tidal-hifi-appimage
pkgver=5.20.1
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
sha256sums=('4a359e1e331b783ca1600e0b79509587ac3a5e583ba136c05351f60b4fb6287b'
            '968b4218f6507746eb0c0a11e9ec4d53b2b4ac36a0c4bd8b89b505a27de8fa09'
            'f06db681e02d8a82f1fdccbb9393e1ff42e12b8528f5eef787fda88b848449f3')
noextract=("${_appimage}")

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/tidal/${_appimage}"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" "${pkgdir}/usr/share/applications/tidal-hifi.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/tidal-hifi.png"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/tidal/${_appimage}" "${pkgdir}/usr/bin/tidal-hifi"
}
