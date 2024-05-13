# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qwerty
pkgname="${_appname}-learner-pake"
_pkgname=Qwerty
pkgver=2.5.1
pkgrel=1
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_ghurl="https://github.com/tw93/Pake"
license=("MIT")
conflicts=("${_appname}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('a8e91a5f5630c7f5625a0530eb5e54ece46e33a883b888542d68b831906ff783'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|com-pake-${_appname}|${pkgname%-pake}|g;s|Office|Utility;|g" -i "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}