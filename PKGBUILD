# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=audacity-appimage
_pkgname=audacity
pkgver=3.2.4
pkgrel=1
epoch=
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=("x86_64")
url="https://www.audacityteam.org"
_githuburl="https://github.com/audacity/audacity"
license=(GPL2 GPL3 "CC-BY 3.0")
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(audacity)
conflicts=(audacity audacity-wxgtk2 audacity-git tenacity-wxgtk3-git tenacity-git audacium-git 	audacity-qt-git audacity-local-git)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/Audacity-${pkgver}/${_pkgname}-linux-${pkgver}-x64.AppImage")
sha256sums=('31284c6bc9e63803cf910d3fc18b4d5d9d0d96357931a5382332b470921157d9')
       
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=audacity/#Exec=audacity/g' -i "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/audacity.AppImage" >> "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
