# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glyphr-studio-desktop-appimage
_pkgname=glyphr-studio-desktop
pkgver=0.5.6
pkgrel=1
pkgdesc="A desktop client for Glyphr Studio built in electron.Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="https://www.glyphrstudio.com/"
_githuburl="https://github.com/glyphr-studio/Glyphr-Studio-Desktop"
license=('GPL3')
depends=(zlib hicolor-icon-theme)
options=(!strip)
optdepends=()
provides=("glyphr-studio")
conflicts=('glyphr-studio-desktop')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Glyphr.Studio-${pkgver}.AppImage")
sha256sums=('4d39d1368ff12a5201fe5e3d2e43ce7369ea5d6973051acc35e2161d33a64f8e')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/glyphr-studio-desktop.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}