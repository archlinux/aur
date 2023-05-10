# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=helioslauncher-appimage
pkgver=2.0.4
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in Electron and Node.js"
arch=('x86_64')
url="https://github.com/dscalzi/HeliosLauncher"
license=('MIT')
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Helios-Launcher-setup-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/dscalzi/HeliosLauncher/master/LICENSE.txt")
sha256sums=('6fd6a2d100e4ff8cd89fb491ca973ed2d751cb51217050ad432223ccb0dc000c'
            '4ffd6e4c132ebc4ecde76d809f9f88e151ee0eb2175e7ea0f0b0b51a9d48539e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/helioslauncher.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
