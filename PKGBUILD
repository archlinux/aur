# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="grx-appimage"
pkgver=2.1.1
pkgrel=1
pkgdesc="Fastest Web Gerber Renderer"
arch=('x86_64')
url="https://grx.creery.org/"
_githuburl="https://github.com/hpcreery/GRX"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}.AppImage"
    "https://raw.githubusercontent.com/hpcreery/GRX/master/LICENSE")
sha256sums=('3a064e397d1b93b9c10c978f652e87e83340c17c24a6948f151c14f0130c93db'
            '6af73551667116d187b1a4e5dac0933f99a4c1151bd1a44c12249cd540a69444')
      
prepare() {
    chmod a+x "grx-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/grx.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/grx-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}