# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-desktop-appimage
pkgver=2.1.4
pkgrel=1
pkgdesc="The official IOTA and Shimmer wallet"
arch=('x86_64')
url="https://firefly.iota.org/"
_githuburl="https://github.com/iotaledger/firefly"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/desktop-${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('d6878cfebafe0a373c3f33c9a113a594a495f648b68e18cc81c2e8eaae8060eb')
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