# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chrolog-appimage"
pkgver=1.1.2
pkgrel=1
pkgdesc="A automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('custom')
depends=('zlib' 'glibc' 'logkeys')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('7f19f3ed147e4c205bb7d8f1fd5a877c24980302132c1a072ac3400906ec9b93')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/chrolog.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}