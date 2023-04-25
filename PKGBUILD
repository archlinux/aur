# Contributor: OpenSorcerer <alex at opensourcery dot eu>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=walc-appimage
pkgver=0.3.0
pkgrel=1
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
provides=()
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v$pkgver/WALC-$pkgver.AppImage")
sha256sums=('0fc318afe1d8627c9e9288594612503eb475321712b8c9d31e74d442906be67f')
options=('!strip')

prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/walc.AppImage|g;s|Social|Network|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}