# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="csbooks-appimage"
pkgver=7.5.0
pkgrel=4
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('unknown')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/latest/csBooks-${pkgver}.AppImage")
sha256sums=('cd3f352fede998f933eaa929809e60cb15745968ae01460845bb531d471e57fa')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/|AppRun|/opt/appimages/csbooks.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}