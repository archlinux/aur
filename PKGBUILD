# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="quba-appimage"
pkgver=1.3.0
pkgrel=1
pkgdesc="A viewer for electronic invoices"
arch=('x86_64')
url="https://github.com/ZUGFeRD/quba-viewer"
license=('Apache')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Quba-${pkgver}.AppImage")
sha256sums=('8aa8bda9dbb18f991ce112c352b5c9d5bf251d81fd1c2a73447c4dd034560f32')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}