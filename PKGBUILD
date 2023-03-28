# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
# Maintainer: zaps166 <spaz16 at wp dot pl>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qmplay2
pkgname="${_pkgname}-appimage"
_appname=QMPlay2
pkgver=23.02.05
pkgrel=2
pkgdesc="A video and audio player which can play most formats and codecs"
arch=('x86_64')
url="https://github.com/zaps166/QMPlay2"
license=(LGPL)
conflicts=("${_pkgname}")
providers=(zaps166)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-1-x86_64.AppImage")
sha256sums=('d5567475a0137a826dd0340deacd0a5e3ec95a70b7e0ce848ae64bda7c19371d')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=QMPlay2/Exec=\/opt\/appimages\/qmplay2.AppImage/g;s/Icon=QMPlay2/Icon=qmplay2/g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 256x256;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}