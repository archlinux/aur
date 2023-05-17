# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="weakauras-companion-appimage"
pkgver=5.0.1
pkgrel=1
pkgdesc="A cross-platform application built to provide the missing link between Wago.io and World of Warcraft"
arch=('x86_64')
url="https://weakauras.wtf/"
_githuburl="https://github.com/WeakAuras/WeakAuras-Companion"
license=('GPL2')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WeakAuras-Companion-${pkgver}.AppImage")
sha256sums=('1e65f65d2d81ffb958cf10f084397d95a24b44e0ec1ff03df0adbaf0535b4bb1')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/weakauras-companion.AppImage|g;s|Utility|Game;Utility|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}