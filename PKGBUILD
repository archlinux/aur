# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-pake
_pkgname=Flomo
_appname="com-pake-${pkgname%-pake}"
pkgver=2.3.5
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_ghurl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'cairo'
    'webkit2gtk'
    'pango'
    'libsoup'
    'openssl'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-pake}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE.md"
)
sha256sums=('b3ab9b1e3bd0c2ab8eca2a892a2f3862efc35fe27ab95c0a8b055747127b9d2c'
            '26fe3d96de120fde3f8716475c49c03092a37c6b102a1ef2aac25a108679b043')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_appname}|${pkgname%-pake}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-pake}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}