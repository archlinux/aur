# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=bookmarks-manager
pkgname="${_pkgname}-appimage"
_appname=bookmark
pkgver=0.1.2
pkgrel=2
pkgdesc="Edit bookmarks, check url."
arch=("x86_64")
url="https://github.com/Hunlongyu/bookmarks-manager"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
optdepends=()
provides=(Hunlongyu)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bookmark-Manager-${pkgver}.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('05cc0f7a8c0664d47a5cb90af113729a27b63419b8dd9649caa81a46967a241f'
            '8502d20adac896483b1915ec006146673f7d5f41d78ab3d0fcc74c077e7cf658')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/bookmark.AppImage/g;s/Icon=bookmark/Icon=bookmarks-manager/g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}