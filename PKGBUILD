# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=giada-appimage
pkgver=0.25.0
pkgrel=1
pkgdesc="An open source, minimalistic and hardcore music production tool. Designed for DJs, live performers and electronic musicians."
arch=('x86_64')
url="https://www.giadamusic.com"
_githuburl="https://github.com/monocasual/giada"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/data/Giada-v${pkgver}-${CARCH}.AppImage")
sha256sums=('78e6ba6181fab2cd247881c1e9e05c51870a6599d2fedf08291df8a730398f1b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}