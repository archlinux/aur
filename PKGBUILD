# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qwerty
pkgname="${_appname}-learner-pake"
_pkgname=Qwerty
pkgver=3.3.5
pkgrel=1
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${_appname}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('db9fbe1db85d0bba0673457d3f5304716f6b38d78e8ef340f2931cd89c6fec40'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/com-pake-${_appname}/${pkgname%-pake}/g
        s/Office/Utility;/g
    " -i "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
