# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="air-controller-desktop-appimage"
_pkgname=air_controller
pkgver=0.4.0
pkgrel=1
pkgdesc="A new handy and powerful Android phone assistant,powered by Flutter."
arch=('x86_64')
url="http://ac.yhdm360.cn/"
_githuburl="https://github.com/air-controller/air-controller-desktop"
license=('MIT')
options=(!strip)
providers=(air-controller)
conflits=(air-controller)
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/AirController_${pkgver}.AppImage")
sha256sums=('9c81fa659acffa74b7576e5dfbc62486d8131157b9d4bfc2a34bdc567bc080c8')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/air_controller_desktop/\/opt\/appimages\/air_controller.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}