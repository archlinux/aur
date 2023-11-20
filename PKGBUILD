# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qwerty
pkgname="${_appname}-learner-pake"
_pkgname=Qwerty
pkgver=2.3.5
pkgrel=1
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_ghurl="https://github.com/tw93/Pake"
license=("GPL3")
conflicts=("${_appname}")
depends=(
    'libsoup'
    'gtk3'
    'gdk-pixbuf2'
    'cairo'
    'webkit2gtk'
    'openssl'
    'pango'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
)
sha256sums=('b0e80a6bc104360cf8d84c6a26527291d06ce94b63a5a812272eeb6f7324ec42')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|com-pake-${_appname}|${pkgname%-pake}|g;s|Office|Utility;|g" -i "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
}