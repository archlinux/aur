# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boostchanger-appimage
_pkgname=boostchanger
pkgver=5.0.1
pkgrel=1
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('any')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
options=(!strip)
providers=(nbebaw)
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('ddb3ffc3f6081e6ab735fd33a67c2cf64f26411056ab4c14108aad53a8c54372')
_install_path="/opt/appimages"

prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/boostchanger.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}