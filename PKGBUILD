# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=southweather-bin
_pkgname=SouthWeather
pkgver=1.0.1
pkgrel=2
pkgdesc="Open weather app for linux"
arch=("x86_64")
url="http://southweather.wlorigin.cf/"
_githuburl="https://github.com/SpiritOTHawk-s-projects/SouthWeather"
license=('ISC')
depends=('bash' 'electron23')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/${pkgver}/SouthWeather-${pkgver}.pacman"
    "LICENSE.md::https://raw.githubusercontent.com/SpiritOTHawk-s-projects/SouthWeather/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('6df4501f4d504de63e4ffd7f7348f7627d5bf9e464f14a5bcd49115165034256'
            'd3c7942b781e1616c13d183bf30ccb1e52837b11d53a7f97ae4b65d85fcd3bac'
            '52c48312b66fe14b8451c339944744f12a7097bbbbd91f47d0f4ba4ca4525069')
prepare() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}