# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qwerty
pkgname="${_appname}-learner-pake"
_pkgname=Qwerty
pkgver=2.3.5
pkgrel=2
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_ghurl="https://github.com/tw93/Pake"
license=("MIT")
conflicts=("${_appname}")
depends=(
    'gtk3'
    'webkit2gtk'
    'openssl-1.1'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('b0e80a6bc104360cf8d84c6a26527291d06ce94b63a5a812272eeb6f7324ec42'
            'e7e0fe962c873b3998eacb9774629b672ff939d46ba5ec028b57cbdeb4900808')
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