# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=southweather-bin
_pkgname=SouthWeather
pkgver=1.0.2
pkgrel=1
pkgdesc="Open weather app for linux"
arch=("x86_64")
url="http://southweather.wlorigin.cf/"
_ghurl="https://github.com/SpiritOTHawk-s-projects/SouthWeather"
license=('custom:ISC')
depends=(
    'electron27'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/SpiritOTHawk-s-projects/SouthWeather/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('9ca4dfb7463140774ad7e816909da4a4699d1cd21c2933e3e4edf6bdd5988457'
            'd3c7942b781e1616c13d183bf30ccb1e52837b11d53a7f97ae4b65d85fcd3bac'
            '5e75bbbfcef300ae29d0fc3c475c2dbd1d2026a8de5b8a8333d6b773dfa1ed43')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}