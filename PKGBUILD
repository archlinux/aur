# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swifty-bin
_pkgname=swifty
pkgver=0.6.13
pkgrel=1
pkgdesc="Free Offline-first Password Manager for MacOS, Windows and Linux."
arch=("x86_64")
url="https://github.com/swiftyapp/swifty"
license=('GPL3')
depends=(hicolor-icon-theme zlib)
provides=()
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Swifty-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('1b68a992bd6ff11a8a21ca2cf1e873f239179d26829a55610ddbe86dc78be894')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
