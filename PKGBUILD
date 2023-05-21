# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="icalingua++-appimage"
pkgver=2.9.13
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL3")
depends=('zlib' 'glibc')
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Icalingua++-${pkgver}.AppImage")
sha256sums=('6be3e59cd5c1fb0fd6aae67d6206963dfd160a1eb7f9a2ef3a0d1efa5b0b1121')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/icalingua++.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%++-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%++-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%++-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}