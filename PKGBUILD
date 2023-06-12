# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="turbowarp-desktop-appimage"
pkgver=1.8.0beta.1
_ver="beta.1"
pkgrel=2
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.turbowarp.org/"
_githuburl="https://github.com/TurboWarp/desktop"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver%${_ver}}-${_ver}/TurboWarp-linux-arm64-${pkgver%${_ver}}-${_ver}.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver%${_ver}}-${_ver}/TurboWarp-linux-armv7l-${pkgver%${_ver}}-${_ver}.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver%${_ver}}-${_ver}/TurboWarp-linux-x86_64-${pkgver%${_ver}}-${_ver}.AppImage")
sha256sums_aarch64=('00ceebeb43653e848b82d678229113b18e8f679f8804bc6db210020b03f4e79c')
sha256sums_armv7h=('89e298f7a85188409359ce3bd7293f7e39ba337c32aa6b6ad819b3c1ab1c76cb')
sha256sums_x86_64=('6dc995066ca16fd93569e9f1f3ecdffcab699b4d360895d626465e70cea7ef6b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}