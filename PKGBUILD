# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=guiscrcpy-appimage
_pkgname=guiscrcpy
pkgver=2023.1.1
pkgrel=2
pkgdesc="A full fledged GUI integration for the award winning open-source android screen mirroring system"
arch=('x86_64')
url="https://guiscrcpy.srev.in/"
_githuburl="https://github.com/srevinsaju/guiscrcpy"
license=('GPL3')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('zlib' 'hicolor-icon-theme' 'scrcpy')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.dev.m.glibc2.35-x86_64.AppImage")
sha512sums=('cc853c5bfbb1ead1905936bd77d3f1c8386f9c3a6e246605a434a9d1b38af2388b43858e5ecac6c20021ce9e0794e4aa2c9e9a9bd89a9d1955b7fdfe84832b75')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/guiscrcpy.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
