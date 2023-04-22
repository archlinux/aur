# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="freac-appimage"
_appname="org.freac.freac"
pkgver=1.1.7
pkgrel=3
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org/"
_githuburl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages/"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('17d5d8ee6c3a0498e1639d002ff64ee557fe3c9f4b347996107d8755ea91f2d6')
prepare() {
    chmod a+x ${pkgname%-appimage}-${pkgver}.AppImage
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=freac|Exec=/opt/appimages/freac.AppImage|g' -i "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}