# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ocat
pkgname="${_pkgname}-appimage"
pkgver=20230019
pkgrel=3
pkgdesc="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager."
arch=("x86_64")
url="https://github.com/ic005k/OCAuxiliaryTools"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
conflit=("${_pkgname}")
providers=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/OCAT-Linux-x86_64.AppImage"
        "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('95de6a299d218f26d3ef3d2b2ff48f669e0d23ab9f025fd498f5a48dff62356e'
            'bd3712bc99be8022441e1b3f3d473848abef0b814ae1cb1b2d65abbe3ed6a71f')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=OCAuxiliaryTools/Exec=\/opt\/appimages\/ocat.AppImage/g;s/Icon=icon/Icon=ocat/g;s/Categories=Application/Categories=Utility/g' \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}