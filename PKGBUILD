# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fifo-browser-appimage"
pkgver=1.2.2
pkgrel=2
pkgdesc="A modern web browser, built on top of modern web technologies such as Electron and React that is mean't to be secure."
arch=('x86_64')
url="https://fifo.snaildos.com/"
_githuburl="https://github.com/snaildos/Fifo-Browser"
license=('GPL3')
conflicts=("${pkgname%-browser-appimage}" "${pkgname%-appimage}")
providers=("snaildos")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fifo-${pkgver}.AppImage")
sha256sums=('9bc6a3e4b31e3d21903e17dc35bc30f86e151e26760641aceac2475c99ea5f58')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fifo-browser.AppImage|g;s|Browser;|Network;|g' -i "${srcdir}/squashfs-root/${pkgname%-browser-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-browser-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-browser-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
