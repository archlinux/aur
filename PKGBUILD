# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=webkitty-appimage
_pkgname=webkitty
pkgver=3.0.0
pkgrel=1
conflit=()
epoch=
pkgdesc="Local web development IDE"
arch=("any")
url="https://dartfling.com/product?pid=3"
_githuburl="https://github.com/yikuansun/webkitty"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WebKitty-${pkgver}.AppImage")
sha256sums=('7d4cc208478c90e3a82945af7c086952a9c64caa9b60abd0407bf8e543ca58e1')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/webkitty.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
