# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=we-read
pkgname="${_appname//-/}-pake"
_pkgname=WeRead
pkgver=2.3.5
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_ghurl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
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
    "LICENSE.html::https://weread.qq.com/web/copyright"
)
sha256sums=('51ac75c7e6b08b98d11c7572c69f8fffee8e7fe380c90b7cc587f0a18bee328e'
            '3363075701076fb58c1d4973b4ea9a88e4ce694fe2af61d66541e1c8c5945883')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|com-pake-${_appname//-/}|${pkgname%-pake}|g;s|Office|Utility;|g" -i "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}