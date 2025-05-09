# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cuuri-bin
_pkgname=Cuuri
pkgver=0.2.5
pkgrel=1
pkgdesc="A GUI client for ChatGPT built with Tauri, Vue, and TypeScript.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/takanotume24/Cuuri"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('94dcf625f96d82ff629ba9c2c18a80b68e5ffe34d15aff815a37f9c9a98457f8')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}