# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiaohongshu
pkgname="${_appname}-pake"
_pkgname=XiaoHongShu
pkgver=3.10.0
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
sha256sums=('de1066b02b2b1c71b7f378999553efb5753bf0c176c86ab543a831b994065829'
            '462d57d8d84d48d7b40c9d2464f47be9898b3cb750690b1822587f653da06758')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/pake-//g
        s/${_appname}_512/${_appname}/g
    " -i "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
