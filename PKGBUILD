# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="qradiolink-appimage"
pkgver=0.8.9
pkgrel=2
pkgdesc="Multimode SDR transceiver for GNU radio"
arch=("x86_64")
url="http://qradiolink.org/"
_githuburl="https://github.com/qradiolink/qradiolink"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'glibc' 'xdg-utils')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}-1/QRadioLink-${pkgver}-1-x86_64.AppImage")
sha256sums=('b0271010d20d3cc1ef0e9e18f7ea98bb385844c6db385da16fd23ad782d43364')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=qradiolink|Exec=/opt/appimages/qradiolink.AppImage|g;s|icon|qradiolink|g;s|TryExec|#TryExec|g' \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/icon.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}