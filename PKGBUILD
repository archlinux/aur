# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=we-read
pkgname="${_appname//-/}-pake"
_pkgname=WeRead
pkgver=2.3.2
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_githuburl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
depends=('gcc-libs' 'glib2' 'libsoup' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE.html::https://weread.qq.com/web/copyright")
sha256sums=('36c49cb211ba2b82a4bf6651db345b88a666e6de459dad6d9ece3393f38cb9fb'
            '2823bad3e8caef103335917a6eee29a50cd64154f8c1dc576f040e3ed32f61fc')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_appname}|${pkgname%-pake}|g;s|Development|Utility|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}