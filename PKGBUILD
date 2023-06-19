# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="turbowarp-desktop-appimage"
pkgver=1.8.0
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.turbowarp.org/"
_githuburl="https://github.com/TurboWarp/desktop"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/TurboWarp-linux-arm64-${pkgver}.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/TurboWarp-linux-armv7l-${pkgver}.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/TurboWarp-linux-x86_64-${pkgver}.AppImage")
sha256sums_aarch64=('f282dd86814849a4790edc471636aea6af251928f95bcf3ffbc5349866b0e0d6')
sha256sums_armv7h=('03c72b184c24032cd78460174e9efac61a1288073b15b1da42058cc82fd90c13')
sha256sums_x86_64=('c1a33633c9591f0f26fde5feedbe35f81c69ee2344d6d75f88c8bb9e8e3c4536')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}