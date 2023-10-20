# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: OpenSorcerer <alex at opensourcery dot eu>
pkgname=walc-appimage
_pkgname=WALC
pkgver=0.3.2
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
makedepends=('squashfuse')
options=("!strip")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v$pkgver/${_pkgname}-$pkgver.AppImage")
sha256sums=('602e7dfa87bf0bd22f0711575fa3e6e654a216fb5ff347e5cd4e7132e6e3b8c5')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|Social|Network|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}