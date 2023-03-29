# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=xiaohongshu
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical xiaohongshu Appimage Client.小红书 App,是年轻人的生活方式社区,每月有超过2亿人在这里分享生活经验,发现真实、美好、多元的世界,找到想要的生活."
arch=('x86_64')
url="https://www.xiaohongshu.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/XiaoHongShu_x86_64.AppImage"
    "LICENSE")
sha256sums=('1abd894042f25713731c84bb8eed2fec2f82feb95047e7790acdf7e3c81da6ad'
            'b653f3f9e1592bfc7182092e5bd1ad2024f3b579a37c2491f65fcf3f34798894')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-xiaohongshu/Exec=\/opt\/appimages\/xiaohongshu.AppImage/g;s/Icon=com-tw93-xiaohongshu/Icon=xiaohongshu/g;s/Name=com-tw93-xiaohongshu/Name=小红书XiaoHongShu/g;s/Development/Utility/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
          
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}