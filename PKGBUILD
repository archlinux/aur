# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fukayo-appimage"
pkgver=0.13.0
pkgrel=1
pkgdesc="Manga reader"
arch=('x86_64')
url="https://github.com/JiPaix/Fukayo"
license=(MIT)
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Fukayo-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/JiPaix/fukayo/beta/LICENSE")
sha256sums=('f982a5dc87485a30ac82f8c77dd400733ee192aa8d34f28fb59f06b7205a7861'
            'c3fb2affb5fa8ed0b1866d379461e7e0c845ac7011f67aa7410cfe080f8d753a')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fukayo.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
