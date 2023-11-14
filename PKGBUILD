# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duolingo-desktop-bin
_appname=dl-desktop
_pkgname=ro.go.hmlendea.DL-Desktop
pkgver=3.6.0
pkgrel=2
pkgdesc="Desktop client for the Duolingo language learning application"
arch=("x86_64")
url="https://github.com/hmlendea/dl-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${_appname}" "${pkgname%-bin}")
depends=(
    'electron24'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/hmlendea/dl-desktop/v${pkgver}/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('f65f94afb246a9addf27480233c946b32e4482e406c3c53bf0e4a091606eef2e'
            '67642cd03a241ff097a83800f39e442c533e8b7a92a9235c0375ef866a708f0e'
            '6c821b8acb3e498429f63b95281d71bc8c829fee15b082e634af80f66acef4d0')
build() {
    sed "s|/opt/${_appname}/${_appname}|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/styles/dark.css" -t "${pkgdir}/usr/lib/${pkgname%-bin}/styles"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}