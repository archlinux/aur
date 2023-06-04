# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="selvania-launcher-appimage"
pkgver=1.3.0
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in electron.js and Node.js (premium and crack)"
arch=('x86_64')
url="http://luuxis.fr/"
_githuburl="https://github.com/luuxis/Selvania-Launcher"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Selvania-Launcher-linux-${CARCH}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/master/LICENSE.md")
sha256sums=('93eac6aff33cf10ef6a81d7fc408630fee00583f984808dd777b0d374144e435'
            '7c73b8f626696c0403394da3dae0d5ed33009cc2d674803d40bc4e2c7e67174b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}