# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="heimer-appimage"
pkgver=4.1.0
pkgrel=3
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
provides=(juzzlin)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Heimer-${pkgver}-x86_64.AppImage")
sha256sums=('067db4705747060f818f870d1ff79704d5b9ff49dad7b395780f88aff443c249')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=heimer|Exec=/opt/appimages/heimer.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}