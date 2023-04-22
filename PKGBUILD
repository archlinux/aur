# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="turbowarp-desktop-appimage"
pkgver=1.7.2beta1
_ver="beta.1"
pkgrel=2
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=("x86_64")
url="https://desktop.turbowarp.org/"
_githuburl="https://github.com/TurboWarp/desktop"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%beta1}-${_ver}/TurboWarp-linux-x86_64-${pkgver%beta1}-${_ver}.AppImage")
sha256sums=('5ce20252583bc0138cd1dd4ef0c8f59f2b72b41e105f2102f460a7a1f5d84564')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/turbowarp-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}