# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eudic-ting-en-appimage
_pkgname=eudic-ting
_originalname=ting_en
pkgver=9.6.2.114
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/ting"
license=('unknown')
options=(!strip)
conflicts=()
depends=('hicolor-icon-theme' 'zlib')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://static.frdic.com/pkg/${_originalname}/${_originalname}.AppImage")
sha256sums=('c01e4231fc4b6c0b0f9bac3b9a4451bad0689e1b83426a04398f838e58ec4081')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/${_originalname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage %F" >> "${srcdir}/squashfs-root/${_originalname}.desktop"
    echo "Icon=${_pkgname}" >> "${srcdir}/squashfs-root/${_originalname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_originalname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_originalname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
