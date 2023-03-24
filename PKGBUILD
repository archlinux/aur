# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=freac
pkgname="${_pkgname}-appimage"
_appname="org.freac.freac"
pkgver=1.1.7
pkgrel=2
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org/"
_githuburl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
options=(!strip)
_install_path="/opt/appimages/"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('17d5d8ee6c3a0498e1639d002ff64ee557fe3c9f4b347996107d8755ea91f2d6')
prepare() {
    chmod a+x ${_pkgname}-${pkgver}.AppImage
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=freac/Exec=\/opt\/appimages\/freac.AppImage/g' -i "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.png"
}