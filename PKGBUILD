# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avidemux2-appimage
_pkgname=avidemux
pkgver=2.8.1
pkgrel=1
epoch=
pkgdesc="Simple video editor"
arch=("x86_64")
url="http://www.avidemux.org"
_githuburl="https://github.com/mean00/avidemux2"
license=(GPL2)
depends=(hicolor-icon-theme zlib)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}_${pkgver}.appImage")
sha256sums=('4e685fbad0b59d007c5a23ab5fd47948ea5979601e693521f7b842edd4d768a3')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=avidemux3_portable/#Exec=avidemux3_portable/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
