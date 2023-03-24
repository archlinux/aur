# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=icalingua
pkgname="${_pkgname}++-appimage"
pkgver=2.9.2
pkgrel=2
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=("x86_64")
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=(AGPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=("${_pkgname}++")
conflicts=("${_pkgname}++")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Icalingua++-${pkgver}.AppImage")
sha256sums=('8bf3d914fe2055f655d5bb15fa4fb2d02baed8c3d30751fcc8116cfe45a99252')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/icalingua.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}