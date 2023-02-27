# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=ocat-appimage
_pkgname=ocat
pkgver=20230019
pkgrel=1
conflit=()
epoch=
pkgdesc="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager."
arch=("any")
url="https://github.com/ic005k/OCAuxiliaryTools"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/OCAT-Linux-x86_64.AppImage")
sha256sums=('95de6a299d218f26d3ef3d2b2ff48f669e0d23ab9f025fd498f5a48dff62356e')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=OCAuxiliaryTools/Exec=\/opt\/appimages\/ocat.AppImage/g' -i "${srcdir}/squashfs-root/default.desktop"
    sed 's/Icon=icon/Icon=ocat/g' -i "${srcdir}/squashfs-root/default.desktop"
    sed 's/Categories=Application;/Categories=Utility/g' -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
