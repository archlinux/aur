# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="opal-appimage"
_appname=Opal
pkgver=1.2.0
pkgrel=1
pkgdesc="Plays relaxing music in the background"
arch=('x86_64')
url="https://codedead.com/"
_githuburl="https://github.com/CodeDead/opal"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Opal-x86_64-${pkgver}.AppImage")
sha256sums=('72015b4031e34cf47cbce202094f058506025836e1e25c1c2226e58642f77417')
   
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    sed "s|Exec=${_appname}|Exec=/${_install_path}/${pkgname%-appimage}.AppImage|g;s|Icon=${_appname}|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}