# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiao-hong-shu
pkgname="${_appname//-/}-pake"
_pkgname=XiaoHongShu
pkgver=3.3.5
pkgrel=1
pkgdesc="Use Pake to package XiaoHongShu.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。"
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('6862012e5c28a28a44c3e4e924747491b3b66ba364503a2ecef58626a0359b7b'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/com-pake-${_appname//-/}/${pkgname%-pake}/g
        s/Office/Utility;/g
    " -i "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
