# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=shutu_client
pkgname="${_appname//_/-}-bin"
_pkgname=ShuTu
_enname=TreeMind
_zhsname="树图思维导图"
pkgver=1.0.7
_electronversion=21
pkgrel=4
pkgdesc="A new generation of 'AI intelligence' mind map.(Prebuilt version.Use system-wide electron)新一代'AI智能'思维导图"
arch=('x86_64')
url="https://shutu.cn"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::https://github.com/zxp19821005/My_AUR_Files/releases/download/${_pkgname}-${pkgver}/${_pkgname}-Linux-${pkgver}.rpm"
    "LICENSE-user.html"
    "LICENSE-privacy.html"
    "LICENSE-upload.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('2997c1de550420063563f4adfa82820aae6d84f1bc9f81940134bb5c8a2dd0b3'
            '0c61137e0949077ce76ecee1d5709b054b272bb6787fa6b2bfe63dbc16175ccd'
            '08b36b6ebe9256e91033557c43fe911857a2eea4c1ac07e19e61c577f219a09a'
            'bce7b2ffb9a99535c7ede2122a9c078226affd95f2cfe4e9831c8f79586429a3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Name=/Name[zh_CN]=/g
        s/Comment=${_zhsname}/Comment=${pkgdesc}/g
        2i\Name=${_enname}
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}