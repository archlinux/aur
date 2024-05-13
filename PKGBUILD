# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=we-read
pkgname="${_appname//-/}-pake"
_pkgname=WeRead
pkgver=2.5.1
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('2f0f824076887a61423c6fd5ed2848071f192ea0ab3df451efcbe90561c6b911'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|com-pake-${_appname//-/}|${pkgname%-pake}|g;s|Office|Utility;|g" -i "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}