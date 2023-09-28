# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiao-hong-shu
pkgname="${_appname//-/}-pake"
_pkgname=XiaoHongShu
pkgver=2.3.2
pkgrel=1
pkgdesc="Use Pake to package XiaoHongShu.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。"
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_githuburl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
depends=('gcc-libs' 'glib2' 'libsoup' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${_pkgname}_${CARCH}.deb"
    "LICENSE")
sha256sums=('749dd0cf6ec63e75f31daa8b34166106009ee3622d6ef30b615c865292a0d895'
            '5f3640c9e042408b0b631faad7cd7baf55ef718686a5f6726b6a29d67c3bd9ca')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_appname}|${pkgname%-pake}|g;s|Development|Utility|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}