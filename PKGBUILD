# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="koodo-reader-appimage"
pkgver=1.5.6
pkgrel=1
pkgdesc="A modern ebook manager and reader with sync and backup capacities"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://koodo.960960.xyz/"
_githuburl="https://github.com/troyeguo/koodo-reader"
license=("AGPL3")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Koodo-Reader-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Koodo-Reader-${pkgver}-arm64.AppImage")
source_i686=("${pkgname%-appimage}-${pkgver}-i686.AppImage::${_githuburl}/releases/download/v${pkgver}/Koodo-Reader-${pkgver}-i386.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Koodo-Reader-${pkgver}-x86_64.AppImage")
sha256sums_aarch64=('a2181164d9bc4eda8df91f01104ba4a3d552baea8e1714ae939ba3e8023b1e42')
sha256sums_armv7h=('a2181164d9bc4eda8df91f01104ba4a3d552baea8e1714ae939ba3e8023b1e42')
sha256sums_i686=('2662e00d4033d20f708d44372e5ab34f94744fa72709200a556fe2ddf426f458')
sha256sums_x86_64=('cc897015442e2916075202283c2e70848010e037eeac153ede2d96c764f4943b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
}