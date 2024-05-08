# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-pake
_pkgname=Flomo
_appname="com-pake-${pkgname%-pake}"
pkgver=2.3.6
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname%-pake}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('763aa47f94ef27effe12e11f4c9abf648c42477a16dfd706071077095d07efc9'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname}|${pkgname%-pake}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-pake}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}