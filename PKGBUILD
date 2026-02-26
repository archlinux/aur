# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=flomo
pkgname="${_appname}-pake"
_pkgname=Flomo
pkgver=3.9.1
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-pake}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('91a50440b4d9c6a116faecfeab86407db232bc3f3501f7b05a4c066e4f180836'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/pake-//g
        s/${_appname}_512/${_appname}/g
    " -i "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
