# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-appimage
pkgver=0.15.34
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Lvce-v${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/main/LICENSE")
sha256sums=('c5f73d26a1287d953733c88cdd95a340e831c83235a6b9dd543acaee7e486c2d'
            '7736b1dbda2b18af09232f9eb619e4d3d79d855058cc7494853f25d1553ed00b')
      
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}