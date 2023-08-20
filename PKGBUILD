# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mini4wdchrono-bin
_pkgname=Mini4wdChrono
pkgver=0.18.0
pkgrel=1
pkgdesc="Software for Arduino based 3-lane lap timer for Tamiya Mini4wd."
arch=('x86_64')
url="https://github.com/Pimentoso/mini4wdchrono"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron9')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/Pimentoso/mini4wdchrono/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('3a4942972f7d028487430956851e651ca6dfb0e2218dc302d47355e9f2a5fc97'
            '9c1774cb6b3301c45bafb5f68c9787c3ce5dfcd909c56cce69ccec56568ff6a8'
            '33a2f40651a4265dd823cbec308f3044c777251da82aa8875461607b62a33563')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    asar pack "${srcdir}/${_pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}