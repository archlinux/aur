# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=diffuse-player-appimage
_pkgname=diffuse
pkgver=3.3.0
pkgrel=1
pkgdesc="A full-featured Subsonic/Jellyfin compatible desktop music player"
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(PPL2)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=(diffuse-player-bin)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-linux-amd64.AppImage")
sha256sums=('2daf98d617d871968a33b0f8f78b40247de4c20dc612e8d507af96a314cdb988')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=diffuse/#Exec=diffuse/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage --no-sandbox %U"  >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png"
}