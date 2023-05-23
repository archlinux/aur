# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-appimage
pkgver=1.1.7
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://serial-studio.github.io/"
_githuburl="https://github.com/Serial-Studio/Serial-Studio"
license=('custom')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/serial-studio-${pkgver}-Linux.AppImage"
    ""LICENSE.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/master/LICENSE.md"")
sha256sums=('22b6a9465b9b56bb321956991f6746117f7f084d56082b28000bed0908919be8'
            '2bd1d916e395ee261da269285a9cb803e6f594b0cb97b50e01b43e0911004d17')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/serial-studio.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
