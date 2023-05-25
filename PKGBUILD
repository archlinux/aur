# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-appimage
pkgver=2.3.44
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
arch=('x86_64')
url="https://www.postybirb.com/"
_githuburl="https://github.com/mvdicarlo/postybirb"
license=('BSD3-Clause')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-plus")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/PostyBirb-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/mvdicarlo/postybirb/master/LICENSE.md")
sha256sums=('45dc119851f148344b3601f5a00de67e00d2575f9dd616bcbd82d4eeda97b49d'
            '12e65eb62d705f4cf38eb2f7b382206fb3155fbdbff559f87c702a5e1c1c2207')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}