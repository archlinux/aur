# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sigma-file-manager-appimage"
pkgver=1.6.0
pkgrel=4
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
sha256sums=('ca4bb1d6707776d3cb2cf3ae589f155173d5e043c51a72970197d24cf3cf9e34')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/sigma-file-manager.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}