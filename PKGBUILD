# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="warteschlangensimulator-appimage"
_appname="Warteschlangensimulator"
pkgver=5.4.1
pkgrel=1
pkgdesc="A free, platform independent, discrete-event, stochastic simulator which allows to model queueing systems in form of flowcharts."
arch=("x86_64")
url="https://a-herzog.github.io/Warteschlangensimulator/"
_githuburl="https://github.com/A-Herzog/Warteschlangensimulator"
license=('Apache')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Warteschlangensimulator-${CARCH}.AppImage")
sha256sums=('5f32227af3f942ad6024e6c84d9e2d70c94a0d04d7df2496fc222310a384c60d')
         
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Simulator.sh|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
         
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}