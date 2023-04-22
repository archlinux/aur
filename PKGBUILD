# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bookmarks-manager-appimage"
_appname=bookmark
pkgver=0.1.2
pkgrel=3
pkgdesc="Edit bookmarks, check url."
arch=("x86_64")
url="https://github.com/Hunlongyu/bookmarks-manager"
license=('MIT')
depends=('zlib' 'glibc')
options=(!strip)
optdepends=()
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bookmark-Manager-${pkgver}.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('05cc0f7a8c0664d47a5cb90af113729a27b63419b8dd9649caa81a46967a241f'
            'c796c92731a81fb917e300438a8e5565ac96507ca0f4052fb3d8e2459e7b0f3b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bookmark.AppImage|g;s|Icon=bookmark|Icon=bookmarks-manager|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}