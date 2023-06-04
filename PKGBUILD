# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sixgrid-appimage
pkgver=0.3.6
pkgrel=2
pkgdesc="Open-Source Desktop Client for e926/e621 and websites alike"
arch=("x86_64")
url="https://github.com/SixGrid/sixgrid"
license=("Apache")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-58cccb3b42651ae2e53a0aaffc778b691db364c0-linux-amd64.AppImage")
sha256sums=('22cfcbfc8679e2d8917e3d1756b1f03faeebc72e1ae74175ffbed492f44e788a')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}