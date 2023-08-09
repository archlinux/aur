# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: OpenSorcerer <alex at opensourcery dot eu>
pkgname=walc-appimage
pkgver=0.3.1
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
depends=('zlib' 'glibc')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v$pkgver/WALC-$pkgver.AppImage")
sha256sums=('9b717569b163614b1f9971c2ef01e8bb247df6bacb6f976b3cf242759db434ce')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    1install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Social|Network|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}