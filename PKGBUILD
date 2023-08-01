# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-desktop-appimage
pkgver=2.1.5_alpha_1
pkgrel=1
pkgdesc="The official IOTA and Shimmer wallet"
arch=('x86_64')
url="https://firefly.iota.org/"
_githuburl="https://github.com/iotaledger/firefly"
license=('Apache')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/desktop-${pkgver//_/-}/${pkgname%-appimage}-${pkgver//_/-}.AppImage")
sha256sums=('7cd677d1a28be8d4f9b5602ab8c0e8aa7aa6feaa7e52354ccf3e07f70a7dd574')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|desktop|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/desktop.desktop"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}