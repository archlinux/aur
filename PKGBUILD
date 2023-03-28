# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=xiaohongshu
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Use Pake to package XiaoHongShu.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。"
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs glib2 pango gtk3 gdk-pixbuf2 glibc cairo webkit2gtk)
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/XiaoHongShu_x86_64.deb"
    "LICENSE")
sha256sums=('0d0b9c5ed10d7fd7ab1eeabe1cfb427d412404d54395b9b64ee75586d8b653c6'
            'b653f3f9e1592bfc7182092e5bd1ad2024f3b579a37c2491f65fcf3f34798894')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。" \
        --icon "${_pkgname}" --categories "Utility" --name "小红书XiaoHongShu" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}