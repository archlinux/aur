# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdoku-appimage
_pkgname=houdoku
pkgver=2.11.0
pkgrel=1
pkgdesc="Manga reader and library manager for the desktop"
arch=('x86_64')
url="https://houdoku.org/"
_githuburl="https://github.com/xgi/houdoku"
license=('MIT')
conflicts=(houdoku)
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Houdoku-${pkgver}.AppImage")
sha512sums=('b1928dc0d0028ad68f69e2a9c1d5a3d46cdc45fe142da8d681c3a0566f6189dfc48f7ab26196ff58c9c367225065379add5a45516db67ac17cf2845396585da7')
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/AppRun/\/opt\/appimages\/houdoku.AppImage/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}