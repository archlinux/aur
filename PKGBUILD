# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="f1mv-lights-integration-appimage"
pkgver=2.2.1
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
sha256sums=('411e7360e404029e27612637f056b466355b643ab536f76291499e1f8a412be6')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/f1mv-lights-integration-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}