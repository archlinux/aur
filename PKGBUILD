# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shutter-encoder-appimage"
pkgver=17.0
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_githuburl="https://github.com/paulpacifico/shutter-encoder"
license=(GPL3)
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.AppImage")
sha256sums=('4ea6e180f36d9e157bd44e61e810a77714f4fe7850e08da81acf4556d92d50d8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|shutter-encoder|/opt/appimages/shutter-encoder.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/icon|shutter-encoder|g' \
        -i "${srcdir}/squashfs-root/usr/share/applications/Shutter_Encoder.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/Shutter_Encoder.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png"
}