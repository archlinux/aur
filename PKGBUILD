# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=warteschlangensimulator-appimage
_appname=Warteschlangensimulator
pkgver=5.5.0
pkgrel=1
pkgdesc="A free, platform independent, discrete-event, stochastic simulator which allows to model queueing systems in form of flowcharts."
arch=("x86_64")
url="https://a-herzog.github.io/Warteschlangensimulator/"
_githuburl="https://github.com/A-Herzog/Warteschlangensimulator"
license=('Apache')
depends=('zlib' 'glibc')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_appname}-${CARCH}.AppImage")
sha256sums=('ca161e42926660b7a575603e440f1c29d73dd5d1c557108e8b9f2745eaa7bee4')
         
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Simulator.sh|${pkgname%-appimage} --no-sandbox|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}