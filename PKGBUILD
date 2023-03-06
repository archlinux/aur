# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sigma-file-manager-appimage
_pkgname=sigma-file-manager
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=("x86_64")
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=()
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/aleksey-hoffman/sigma-file-manager/releases/download/v1.6.0/Sigma-File-Manager-1.6.0-Linux-Debian.AppImage")
sha256sums=('ca4bb1d6707776d3cb2cf3ae589f155173d5e043c51a72970197d24cf3cf9e34')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo 'Exec="/opt/appimages/sigma-file-manager.AppImage" --no-sandbox %U' >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}