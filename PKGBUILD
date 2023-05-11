# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="prospect-mail-appimage"
pkgver=0.4.0
pkgrel=1
pkgdesc="An Outlook mail desktop client powered by Electron"
arch=('x86_64')
url="https://github.com/julian-alarcon/prospect-mail"
license=('MIT')
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-electron")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Prospect-Mail-${pkgver}.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('f02340fc934a68dbff9e9f965969bf89085955dd56ea0bb654c58fe536857141'
            'd0e5830cefea162e44ae617ea67300234f69b9fc9c2c9e220ad2b56f9cc189df')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/prospect-mail.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
