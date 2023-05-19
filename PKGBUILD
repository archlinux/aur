# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mqttx-appimage
pkgver=1.9.3
pkgrel=1
pkgdesc="Powerful cross-platform MQTT 5.0 Desktop, CLI, and WebSocket client tools"
arch=('x86_64')
url="https://mqttx.app/"
_githuburl="https://github.com/emqx/MQTTX"
license=('Apache')
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
options=(!strip)
conflicts=("${pkgname%-appimage}")
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/MQTTX-${pkgver}.AppImage")
sha256sums=('2444302ea38ffa4385233bf1377813488ceaf43322c08a12d798fdb46f72bd5a')

prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mqttx.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}