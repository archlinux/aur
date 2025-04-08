# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=binggpt
pkgname="${_pkgname}-ee-bin"
_appname=BingGPT
pkgver=0.4.8
_electronversion=26
pkgrel=2
pkgdesc="BingGPT Enhanced Editon - Desktop application of new Bing's AI-powered chat.A rewritten version.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/fangkehou-team/BingGPT_Enhanced_Editon"
license=("Apache-2.0")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-desktop"
    "${pkgname%-bin}"
)
provides=("${_pkgname}-desktop")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_appname}-Linux-aarch64-${pkgver}.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_appname}-Linux-x86_64-${pkgver}.rpm")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('88d002f04196de20c24493f954b3a763601ea7008e9d78859480a680e21d3501')
sha256sums_x86_64=('351c9b06eb6dda2a11640fafe182c2ab5d3b97f5975af8cbba577571a31380f3')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\"\/opt\/${_chsname}\/${_appname}\"/${pkgname%-bin}/g
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}