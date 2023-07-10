# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fifo-browser-appimage"
pkgver=1.3.1
pkgrel=1
pkgdesc="A modern web browser, built on top of modern web technologies such as Electron and React that is mean't to be secure."
arch=('x86_64')
url="https://fifo.snaildos.com/"
_githuburl="https://github.com/snaildos/Fifo-Browser"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fifo-${pkgver}.AppImage")
sha256sums=('68d59da728a07076d34dc05180d08d9e6b3740062590b996b6bd5c93a3072b18')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-browser-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Browser;|Network;|g" -i "${srcdir}/squashfs-root/${pkgname%-browser-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-browser-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}