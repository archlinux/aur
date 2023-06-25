# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="eudic-ting-en-appimage"
_appname=ting_en
pkgver=9.6.2.114
pkgrel=5
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="http://dict.eudic.net/ting/"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-en-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-en-appimage}-${pkgver}.AppImage::https://static.frdic.com/pkg/${_appname}/${_appname}.AppImage"
    "LICENSE.html")
sha256sums=('c01e4231fc4b6c0b0f9bac3b9a4451bad0689e1b83426a04398f838e58ec4081'
            '9609c02bb494650f252ac0c173ef94ffac0a3012f62c9e2ec62f30284081d120')
prepare() {
    chmod a+x "${pkgname%-en-appimage}-${pkgver}.AppImage"
    "./${pkgname%-en-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-en-appimage}.AppImage|g;s|Icon=${_appname}|Icon=${pkgname%-en-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-en-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-en-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-en-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-en-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}