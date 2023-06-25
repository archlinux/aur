# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-plus-appimage
pkgver=3.1.22
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
arch=('x86_64')
url="https://www.postybirb-plus.com/"
_githuburl="https://github.com/mvdicarlo/postybirb-plus"
license=('BSD3-Clause')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${pkgname%-plus-appimage}" "${pkgname%-plus-appimage}-appimage")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/mvdicarlo/postybirb-plus/master/LICENSE")
sha256sums=('84429e11fac4ab31460f67ee7c504f56fcdbf99dcdf86d2dfdb469b0be45cc44'
            'a0b91aa0ffc9564128c6599eac1fc0ba93b8fe477dff6258ef315f0019b5726d')
prepare() {
  chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
  "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
  sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}