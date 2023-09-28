# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-pake
_pkgname=Flomo
_appname="com-tw93-${pkgname%-pake}"
pkgver=2.3.2
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_githuburl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
depends=('gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'pango' 'libsoup' 'openssl')
makedepends=('gendesk')
source=("${pkgname%-pake}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE.md")
sha256sums=('3b44c0fafed58bb9b9740970e93e977c5af9da206f02fc5a16a470fc879aec8d'
            '26fe3d96de120fde3f8716475c49c03092a37c6b102a1ef2aac25a108679b043')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Development|Utility|g" -i "${srcdir}/usr/share/applications/${pkgname%-pake}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-pake}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-pake}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}