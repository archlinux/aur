# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duolingo-desktop-bin
_appname=dl-desktop
_pkgname=ro.go.hmlendea.DL-Desktop
pkgver=3.5.0
pkgrel=3
pkgdesc="Desktop client for the Duolingo language learning application"
arch=("x86_64")
url="https://github.com/hmlendea/dl-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${_appname}" "${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/hmlendea/dl-desktop/master/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('6e6b7f0193089062e996ce1ebd3ece2273bc996380b0e56374666b93cf2b88ac'
            '67642cd03a241ff097a83800f39e442c533e8b7a92a9235c0375ef866a708f0e'
            'f3c357d67d8b75d7edab6817e1f1df78a7cfde95d3bb88af0920ddd54e4ffd53')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|/opt/${_appname}/${_appname}|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}