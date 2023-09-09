# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_appname=Calendar
pkgver=1.0.12
pkgrel=2
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('qt6-scxml' 'openssl' 'bash' 'qt6-base' 'glibc' 'gcc-libs' 'qt6-webengine' 'qt6-multimedia')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb")
sha256sums=('a12313b5f346d1de4c596b796081a8ef71f84ebc7207eb0caa943842bbc21d27')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${_appname}/bin/${_appname}.sh|${pkgname%-bin}|g;s|Path=/opt/${_appname}|Path=/opt/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_appname}/share/applications/org.Rabbit.${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/bin/${_appname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/share/applications/org.Rabbit.${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_appname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}