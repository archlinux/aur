# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sigma-file-manager-appimage"
pkgver=1.7.0
pkgrel=1
pkgdesc="A free, open-source, quickly evolving, modern file manager (explorer / finder) app for Windows and Linux."
arch=("x86_64")
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
provides=(aleksey-hoffman)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Sigma-File-Manager-${pkgver}-Linux-Debian.AppImage")
sha256sums=('5192b8e47bcfae7a2676141eefa9ed29636e17e7e4c8e095854e160328ccc58e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}