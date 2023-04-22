# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="moonplayer-appimage"
_appname=com.github.coslyk.MoonPlayer
pkgver=4.1
pkgrel=3
pkgdesc="All-in-One video player that can play videos from Youtube, Bilibili etc. as well as local videos."
arch=("x86_64")
url="https://coslyk.github.io/moonplayer.html"
_githuburl="https://github.com/coslyk/moonplayer"
license=('GPL3')
conflit=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/MoonPlayer--x86_64.AppImage")
sha256sums=('b81b809dcbbd4dd9364d7123500b97e29f1a3ed85410700c58ce3235ef4be3de')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=moonplayer|Exec=/opt/appimages/moonplayer.AppImage|g;s|Icon=com.github.coslyk.MoonPlayer|Icon=moonplayer|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 24x24 32x32 64x64 128x128;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}