# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xiaohongshu-pake"
_appname="com-tw93-xiaohongshu"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package XiaoHongShu.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活 。"
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${pkgname%-pake}")
depends=('hicolor-icon-theme' g'cc-libs' 'glib2' 'dbus' 'gtk3' g'dk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/XiaoHongShu_x86_64.deb"
    "LICENSE::'https://agree.xiaohongshu.com/h5/terms/ZXXY20220331001/-1'")
sha256sums=('b67305224e176ad1c259aee4b4f293b5b6bcb6df9ed64cff789007391cd6a4f6'
            'b653f3f9e1592bfc7182092e5bd1ad2024f3b579a37c2491f65fcf3f34798894')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname%-pake}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "${pkgname%-pake}" --categories "Utility" --name "小红书XiaoHongShu" --exec "/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}