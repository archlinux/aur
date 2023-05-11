# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-gui-appimage
pkgver=2.2.1
pkgrel=1
pkgdesc="Modern graphical user interface to peek into redis database (unofficial)"
arch=('x86_64')
url="https://github.com/ekvedaras/redis-gui"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ekvedaras/redis-gui/main/LICENSE")
sha256sums=('037b791cd5750f553f7908550759acb635cf36b453733a536848836cda366b76'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/redis-gui.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}