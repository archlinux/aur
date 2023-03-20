# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=heimer-appimage
_pkgname=heimer
pkgver=4.1.0
pkgrel=1
epoch=
pkgdesc="Heimer is a simple cross-platform mind map, diagram, and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
optdepends=()
provides=(heimer)
conflicts=(heimer)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Heimer-${pkgver}-x86_64.AppImage")
sha256sums=('067db4705747060f818f870d1ff79704d5b9ff49dad7b395780f88aff443c249')
    
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
