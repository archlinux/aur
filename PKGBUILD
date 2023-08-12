# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="exe-appimage"
pkgver=2.8.1
pkgrel=1
pkgdesc="A Elearning XHTML/HTML5 editor"
arch=('x86_64')
url="http://exelearning.net/"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://github.com/exelearning/iteexe/releases/download/${pkgver}/eXeLearning-${pkgver}.glibc2.28-${arch}.AppImage")
sha256sums=('7acb906e5b39fcfef03145f83914f70901563ec2bf500429097b8adce6865fe8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|exe %f|/opt/appimages/exe.AppImage %f|g' -i "${srcdir}/squashfs-root/eXeLearning.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 48x48;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/eXeLearning.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
