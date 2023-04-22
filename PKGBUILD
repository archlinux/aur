# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="opal-appimage"
_appname=Opal
pkgver=1.1.0
pkgrel=1
pkgdesc="Plays relaxing music in the background"
arch=('x86_64')
url="https://codedead.com/"
_githuburl="https://github.com/CodeDead/opal"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Opal-x86_64-${pkgver}.AppImage")
sha256sums=('14b8fcfb4984ad65dc6d58eb6d85b5833fbca7d0b38123feec103294056e114a')
   
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=Opal|Exec=/opt/appimages/opal.AppImage|g;s|Icon=Opal|Icon=opal|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}