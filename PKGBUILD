# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="quba-appimage"
pkgver=1.2.1
pkgrel=1
pkgdesc="A viewer for electronic invoices"
arch=('x86_64')
url="https://github.com/ZUGFeRD/quba-viewer"
license=('Apache')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Quba-${pkgver}.AppImage")
sha256sums=('e32fda4c8967538647a6f546e3ccee3f437ce8cf75bb7793dc7349fe90dcbf97')
     
prepare() {
    chmod a+x "quba-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/quba.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/quba-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}