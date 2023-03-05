# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=turbowarp-desktop-appimage
_pkgname=turbowarp-desktop
pkgver=1.7.1
pkgrel=2
epoch=
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=("x86_64")
url="https://desktop.turbowarp.org/"
_githuburl="https://github.com/TurboWarp/desktop"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(turbowarp)
conflicts=(turbowarp-desktop-bin)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/TurboWarp-linux-x86_64-${pkgver}.AppImage")
sha256sums=('6cd3d0fa479a4f4cb281fdce3e80daaf33ec80ee5f7f8e0ec5d8029827efc5d0')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/turbowarp-desktop.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}