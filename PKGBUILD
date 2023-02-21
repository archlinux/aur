# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=heimer-appimage
_pkgname=heimer
pkgver=3.7.0
pkgrel=1
epoch=
pkgdesc="Heimer is a simple cross-platform mind map, diagram, and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(heimer)
conflicts=(heimer)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Heimer-${pkgver}-x86_64.AppImage")
sha256sums=('8f2c8fafe8c6b413e6f2c456915097c690cbe83e6b67aad5b26ae7ab3a8c0344')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=heimer/Exec=\/opt\/appimages\/heimer.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
