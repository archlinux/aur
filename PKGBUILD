# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="live-plus-plus-appimage"
pkgver=2.1.0
pkgrel=1
pkgdesc="Lightweight live streaming client.轻量级的直播客户端"
arch=('x86_64')
url="https://github.com/dipelta/live-plus-plus"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "live++" "live++-appimage")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/live++-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/dipelta/live-plus-plus/master/LICENSE")
sha256sums=('8e07f2ba78a0648992ae72dc281aa5b58cd5ec4d6b65134d5d38b29f971a3657'
            '8c66ee49d3a6ff7eb085eb7d896bdea56da0cac5c97bd60735847901d006f748')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root//usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}