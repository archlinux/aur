# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lunarcalendar-bin
_pkgname=LunarCalendar
pkgver=0.2.7
pkgrel=4
pkgdesc="Chinese Lunar Date Control Written in Qt.用Qt写的中国农历日期控件"
arch=("x86_64")
url="https://github.com/KangLin/LunarCalendar"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'qt6-base' 'gcc-libs' 'qt6-scxml' 'openssl' 'sh' 'qt6-webengine')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"3
    "${pkgname%-bin}.sh")
sha256sums=('747e060267deaaf907303908c0982684723e397a95db6337e125969461eea296'
            '3bdb0719908083528cc499e90ca528e73e9a5d2e04b14aed39fbd17fd4604a07')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${_pkgname}/bin/${_pkgname}.sh|${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/org.Rabbit.${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/org.Rabbit.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}