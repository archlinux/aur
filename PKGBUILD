# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=air-controller
pkgname="${_pkgname}-desktop-appimage"
_appname=air_controller
pkgver=0.4.0
pkgrel=2
pkgdesc="A new handy and powerful Android phone assistant,powered by Flutter."
arch=('x86_64')
url="http://ac.yhdm360.cn/"
_githuburl="https://github.com/air-controller/air-controller-desktop"
license=('MIT')
options=(!strip)
providers=("${_pkgname}")
conflits=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/AirController_${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9c81fa659acffa74b7576e5dfbc62486d8131157b9d4bfc2a34bdc567bc080c8'
            '210c46d70ffbee3c0d2c213c64194a0395f3f36c1475c136e222e3ac1e863609')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/air_controller_desktop/\/opt\/appimages\/air-controller.AppImage/g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}