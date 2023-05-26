# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kubenav-appimage
pkgver=4.2.1
pkgrel=1
pkgdesc="The navigator for your Kubernetes clusters right in your pocket."
arch=('x86_64')
url="https://kubenav.io/"
_githuburl="https://github.com/kubenav/kubenav"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/kubenav/kubenav/main/LICENSE")
sha256sums=('7b688a2df033ad3005ebd2d8a3df90c66e47b670a4738e3442de367342f80641'
            '5c11576cf31183a022b35080ac4d6c999d0f844758ce6fdf8491aa1476d852a7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=kubenav|Exec=/opt/appimages/kubenav.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}