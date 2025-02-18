# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=diffuse
pkgname="${_appname}-player-bin"
pkgver=3.5.0
pkgrel=1
pkgdesc="A music player that connects to your cloud/distributed storage.(Prebuilt version)"
arch=('x86_64')
url="https://diffuse.sh/"
_ghurl="https://github.com/icidasset/diffuse"
license=("LicenseRef-PPL-2.0.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${_appname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/icidasset/diffuse/main/LICENSE"
)
sha256sums=('c30ef79b38b9e5cc86d28e482948523cfcf05991a9e33c216960bbd64f9b8bc5'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
prepare() {
    sed -e "
        s/Exec=${_appname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1716x1716/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}