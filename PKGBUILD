# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiaohongshu
pkgname="${_appname}-pake"
_pkgname=XiaoHongShu
pkgver=3.14.0
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
sha256sums=('c8d1e62c9bdf5d5eab9b5fe85680147dc584f4a2550d553aeab0e7b4edecb3c2'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/pake-//g
        s/${_appname}_512/${_appname}/g
    " "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
