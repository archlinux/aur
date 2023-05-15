# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gptfusion-appimage"
pkgver=0.7.1
pkgrel=1
pkgdesc="GPT聚合版是一个聚合了多个GPT聊天机器人的跨平台聊天工具, 支持多个免费GPT镜像, 支持自定义导入镜像, 支持POE,文心一言等多个平台."
arch=("x86_64")
url="https://github.com/lpdswing/GPTFusion"
license=(GPL3)
depends=('glib2' 'glibc' 'gdk-pixbuf2' 'webkit2gtk' 'gtk3')
makedepends=('gendesk')
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/GPTFusion.AppImage"
    "gptfusion.png::https://raw.githubusercontent.com/lpdswing/GPTFusion/main/build/appicon.png")
sha256sums=('dfd2a978a6e9001555b7aff58b666aa32d1f81edca33dddcdf41c1542a3277a5'
            '470456008e1b4054229e95b6fee0401321c514d39569fb9c76004a8e8b753034')

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "GPTFusion" --exec "/opt/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
