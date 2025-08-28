# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicat-bin
_pkgname=Musicat
pkgver=0.13.1
pkgrel=1
pkgdesc="A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/basharovV/musicat"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'alsa-lib'
    'gtk3'
    'webkit2gtk-4.1'
)
source=("${pkgname}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('294654b82e39f89bb3177162524763e1524014570857ee2d3fe0db2fef94144b')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Development/AudioVideo/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/"* -t "${pkgdir}/usr/lib/${_pkgname}/resources"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
