# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boostchanger-bin
pkgver=5.0.3
pkgrel=2
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE::https://raw.githubusercontent.com/nbebaw/boostchanger/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('4f9d2239359802b2f0e3662556114a2c48a9f232064d6356f1a1501c7dd91726'
            'af8aec94b8f5c88f4c4e4435570b94d143970c621048db7e25f27403fa4ec02e'
            '2526ec958e4792113cd62d48c8c8445826b90ae4c4c75ae7ed924c8ce731bceb')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" 
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}