# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koishi
pkgname="${_pkgname}-desktop-bin"
_appname="chat.${_pkgname}.desktop"
pkgver=0.11.2
pkgrel=1
pkgdesc="Launch Koishi from your desktop"
arch=('x86_64')
url="https://koishi.chat/manual/starter/"
_ghurl="https://github.com/koishijs/koishi-desktop"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.zip")
depends=(
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.svg::https://raw.githubusercontent.com/koishijs/koishi-desktop/v${pkgver}/packages/assets/${_pkgname}.svg"
)
sha256sums=('0c307272e1980cef6e593112dcb6476c67112488ec2976797a5ac9967e5bbd3d'
            'ac9209c0944853d0329ce23d150fb73a7859c41f5a3170f8f970dc9b955ffc6f')
build() {
    gendesk -q -f -n --pkgname "${_pkgname}-desktop-bin" --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/koi" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}