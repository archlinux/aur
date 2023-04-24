# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="imhex-appimage"
pkgver=1.28.0
pkgrel=1
pkgdesc="A Hex Editor for Reverse Engineers, Programmers and people who value their retinas when working at 3 AM."
arch=("x86_64")
url="https://imhex.werwolv.net/"
_githuburl="https://github.com/WerWolv/ImHex"
license=('GPL2')
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-x86_64.AppImage")
sha256sums=('b63fe185a70b8a6b8b4f895ece7e7801c397ec265391ae6a6d84b6c16dd48249')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=imhex|Exec=/opt/appimages/iamhex.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}