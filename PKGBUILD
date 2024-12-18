# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cuuri-bin
_pkgname=Cuuri
pkgver=0.2.2
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
sha256sums=('bfe9b5b9f9f1808b1b55be49d1f4f6e62d912317fe6d0d5700504b53bae6e4c4')
prepare() {
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Categories=/Categories=Utility;/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
