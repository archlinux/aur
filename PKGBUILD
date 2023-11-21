# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gptfusion-appimage
_pkgname=GPTFusion
pkgver=0.7.2
pkgrel=1
pkgdesc="GPT聚合版是一个聚合了多个GPT聊天机器人的跨平台聊天工具, 支持多个免费GPT镜像, 支持自定义导入镜像, 支持POE,文心一言等多个平台."
arch=("x86_64")
url="https://github.com/lpdswing/GPTFusion"
license=(GPL3)
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'gdk-pixbuf2'
    'webkit2gtk'
    'gtk3'
)
makedepends=(
    'gendesk'
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}.AppImage"
    "${pkgname%-appimage}.png::https://raw.githubusercontent.com/lpdswing/GPTFusion/v${pkgver}/build/appicon.png"
)
sha256sums=('9cb9436eb881f237e5ab7a37a306b15ce12768782f797d2eb6e0aa3ad5cf691e'
            '470456008e1b4054229e95b6fee0401321c514d39569fb9c76004a8e8b753034')
build() {
    gendesk -q -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-appimage} --no-sandbox %U"
    mv "${pkgname}.desktop" "${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}