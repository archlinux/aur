# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="air-controller-desktop-appimage"
_appname=air_controller
pkgver=0.4.0
pkgrel=3
pkgdesc="A new handy and powerful Android phone assistant,powered by Flutter."
arch=('x86_64')
url="http://ac.yhdm360.cn/"
_githuburl="https://github.com/air-controller/air-controller-desktop"
license=('MIT')
options=(!strip)
providers=("${pkgname%-desktop-appimage}")
conflits=("${pkgname%-desktop-appimage}" "${pkgname%-appimage}")
depends=('zlib' 'glibc')
source=("${pkgname%-desktop-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/AirController_${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9c81fa659acffa74b7576e5dfbc62486d8131157b9d4bfc2a34bdc567bc080c8'
            '72bf32e1daa153b870aff8200c06521b4d15d7aedba46d4c37570c49cacc1ace')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-desktop-appimage}-${pkgver}.AppImage"
    "./${pkgname%-desktop-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|air_controller_desktop|/opt/appimages/air-controller.AppImage|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-desktop-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-desktop-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-desktop-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-desktop-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}