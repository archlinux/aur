# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="swifty-appimage"
pkgver=0.6.13
pkgrel=3
pkgdesc="Free Offline-first Password Manager for MacOS, Windows and Linux."
arch=("x86_64")
url="https://getswifty.pro/"
_githuburl="https://github.com/swiftyapp/swifty"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
conflit=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}")
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Swifty-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('1b68a992bd6ff11a8a21ca2cf1e873f239179d26829a55610ddbe86dc78be894')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/swifty.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}