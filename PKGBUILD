# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shutter-encoder-appimage"
pkgver=17.2
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_githuburl="https://github.com/paulpacifico/shutter-encoder"
license=(GPL3)
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.AppImage")
sha256sums=('0d54a982e5b49dafa1e743957a6bb76d0bb3239a1511e6761a0c8402e8fee8d9')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${pkgname%-appimage}|${_install_path}/${pkgname%-appimage}.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/icon|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/usr/share/applications/Shutter_Encoder.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/Shutter_Encoder.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
}