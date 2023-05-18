# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="f1mv-lights-integration-appimage"
pkgver=2.1.0
pkgrel=1
pkgdesc="The best way to connect your smart home lights to MultiViewer."
arch=('x86_64')
url="https://f1mvli.jstt.me/"
_githuburl="https://github.com/JustJoostNL/F1MV-Lights-Integration"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/F1MV-Lights-Integration-${pkgver}.AppImage")
sha256sums=('36dac45e9b0d2e1c210b64cb16b9172e28c8538d2de64c2292b381ecea921c1f')
     
prepare() {
    chmod a+x "f1mv-lights-integration-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/f1mv-lights-integration.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/f1mv-lights-integration-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1x1/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}