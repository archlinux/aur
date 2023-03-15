# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bookmarks-manager-appimage
_pkgname=bookmark
pkgver=0.1.2
pkgrel=1
pkgdesc="Edit bookmarks, check url."
arch=("x86_64")
url="https://github.com/Hunlongyu/bookmarks-manager"
license=('MIT')
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(Hunlongyu)
conflicts=(bookmarks-manager)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bookmark-Manager-${pkgver}.AppImage")
sha256sums=('05cc0f7a8c0664d47a5cb90af113729a27b63419b8dd9649caa81a46967a241f')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/bookmark.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}