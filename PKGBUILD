# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moonplayer-appimage
_pkgname=com.github.coslyk.MoonPlayer
_installedname=moonplayer
pkgver=4.1
pkgrel=1
pkgdesc="All-in-One video player that can play videos from Youtube, Bilibili etc. as well as local videos."
arch=("x86_64")
url="https://coslyk.github.io/moonplayer.html"
_githuburl="https://github.com/coslyk/moonplayer"
license=(GPL3)
conflit=(moonplayer moonplayer-git)
depends=(hicolor-icon-theme zlib)
options=(!strip)
_install_path="/opt/appimages"
source=("${_installedname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}_${pkgver}.appImage")
sha256sums=('b81b809dcbbd4dd9364d7123500b97e29f1a3ed85410700c58ce3235ef4be3de')
prepare() {
    chmod a+x "${_installedname}-${pkgver}.AppImage"
    "./${_installedname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=moonplayer/Exec=\/opt\/appimages\/moonplayer.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    sed 's/Icon=com.github.coslyk.MoonPlayer/Icon=moonplayer/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_installedname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_installedname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_installedname}.desktop"
    for i in 16x16 24x24 32x32 64x64 128x128;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_installedname}.png"
    done
}
