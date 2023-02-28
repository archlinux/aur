# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nxshell-appimage
_pkgname=nxshell
pkgver=1.9.0
pkgrel=1
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=(!strip)
conflicts=(nxshell-bin)
depends=(zlib hicolor-icon-theme)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/NxShell-x86_64-linux-${pkgver}-202211250327.AppImage")
sha512sums=('d8078cec45a794d0abc6c2544f87a47560d03b6d4d04082610e05afb380cea1692d823f90c1c320402455b6aeaf7761b5138c774bb3b5f554db6aabfe9fe0767')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/nxshell.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
