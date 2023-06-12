# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=felida-appimage
pkgver=0.2.4
pkgrel=1
pkgdesc="A lightweight Chromium Browser using Electron.js!"
arch=("x86_64")
url="https://github.com/raluvy95/FelidaBrowser"
license=('GPL3')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Felida.Browser-${pkgver}.AppImage")
sha256sums=('9bd0aa2b9f06f0a9088837834afc3bce0ac3a748b6fd0e0f47590d5d2c20242b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}