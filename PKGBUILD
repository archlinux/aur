# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=droppoint
pkgname="${_pkgname}-appimage"
pkgver=1.2.1
pkgrel=3
pkgdesc="Make drag-and-drop easier using DropPoint. Drag content without having to open side-by-side windows"
arch=('x86_64')
url="https://droppoint.netlify.app/"
_githuburl="https://github.com/GameGodS3/DropPoint"
license=('GPL3')
options=(!strip)
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/DropPoint-${pkgver}.AppImage")
sha256sums=('deace06f391479922fd5832f85f0d7d5017cff7495ce96a93c93da48d383a893')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/droppoint.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}