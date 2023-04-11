# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="losslesscut-appimage"
pkgver=3.54.0
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing."
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=(GPL2)
options=(!strip)
providers=(mifi)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/LosslessCut-linux-x86_64.AppImage")
sha256sums=('23ffed09d6e62ba845d786f6cc1ff012888edb4ec2ddd905901716ee53d56a89')
_install_path="/opt/appimages"
  
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/losslesscut.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}
