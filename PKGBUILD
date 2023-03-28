# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=mapeo-desktop
pkgname="${_pkgname}-appimage"
pkgver=5.6.0
pkgrel=2
pkgdesc="An offline map editing application for indigenous territory mapping in remote environments."
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=('GPL3')
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.AppImage")
sha256sums=('dfaa9f660fc6a7a3875a126e2aa7139f6c77a9a33fff7080a1e8bc17b6d4bf43')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/mapeo-desktop.AppImage/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}