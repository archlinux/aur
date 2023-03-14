# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mapeo-desktop-appimage
_pkgname=mapeo-desktop
pkgver=5.6.0
pkgrel=1
pkgdesc="Local-first mapping and monitoring in remote environments"
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=('GPL3')
conflicts=(mapeo-desktop)
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.AppImage")
sha512sums=('d4b0bb1c2ffe52e29f04014b3fa00ed84d848529b196f530decbd3299d6992b2835c31133c75321932cbc34e48b1b57167ec759f24a514c18aa475f9b484926f')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/AppRun/\/opt\/appimages\/mapeo-desktop.AppImage/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
