# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-appimage
_pkgname=freac
pkgver=1.1.7
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org/"
_githuburl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=('freac')
provides=('freac')
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages/"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
md5sums=('b5fe625c3bd1b77121477feba3dd24ff')
prepare() {
    chmod a+x ${_pkgname}-${pkgver}.AppImage
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=freac/Exec=\/opt\/appimages\/freac.AppImage/g' -i "${srcdir}/squashfs-root/usr/share/applications/org.freac.freac.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/org.freac.freac.desktop" "${pkgdir}/usr/share/applications/org.freac.freac.desktop"
    install -Dm644 "${srcdir}/squashfs-root/org.freac.freac.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.freac.freac.png"
}
