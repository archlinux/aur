# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=droppoint-appimage
_pkgname=droppoint
pkgver=1.2.1
pkgrel=1
pkgdesc="Make drag-and-drop easier using DropPoint. Drag content without having to open side-by-side windows"
arch=('x86_64')
url="https://droppoint.netlify.app/"
_githuburl="https://github.com/GameGodS3/DropPoint"
license=('GPL3')
options=(!strip)
conflicts=()
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/DropPoint-${pkgver}.AppImage")
sha512sums=('7688557752c3ecbc048f93602837bb62bef7774b2557ff78e615769a333e83ad809310c2235cff8608bcbf60a7ec308d6abc38afc393c13bfe9b3e4579a9d9f3')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/droppoint.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
