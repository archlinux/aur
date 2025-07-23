# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shinden-client-bin
_pkgname=Shinden.Client
pkgver=4.0.1
pkgrel=1
pkgdesc="Unofficial client for the polish anime websites. It allows you to watch anime without being exposed to ads and pop-ups.(Prebuilt version)"
arch=("x86_64")
url="https://github.com/Tsugumik/shinden-client"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Tsugumik/shinden-client/app-v${pkgver}/LICENSE"
)
sha256sums=('df64fb37b25b0c7d7ba8ae50e01b430ada1d7db3450f27a69e2376951a3e3dea'
            'fce4e2ea584ea650e48248400d92e98b522cf58d15bde4b1e55345817fe8bc91')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname//./}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname//./}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname//./}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname//./}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktp"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
