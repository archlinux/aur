# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="threema-for-desktop-appimage"
_appname="threema-desktop"
pkgver=2.5.1
pkgrel=1
pkgdesc="Unofficial desktop client for Threema"
arch=('x86_64')
url="https://github.com/GeekCornerGH/threema-for-desktop"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Threema-For-Desktop-linux-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/GeekCornerGH/threema-for-desktop/master/LICENSE")
sha256sums=('8954d9b28bdc3b3c9caa115b3a15be79279366d8afb087b8a5e9577ec8bf6066'
            '92f52afa40f9343b922a111f5e79cfcb864e77e334b92d63b0a6c8bd9c45d94d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}