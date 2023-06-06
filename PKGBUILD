# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kubenav-appimage
pkgver=4.2.2
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
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/kubenav/kubenav/main/LICENSE")
sha256sums=('d1b5165842a7cc848c9e6b98594303e1e80788e8e3a8d97a36a5f46a901588a1'
            '8b3342858e9f80f58fd2b895d71aa21d1b7c96c6ee1923ea8cb7ee319acc44f8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}