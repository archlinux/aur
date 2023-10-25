# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=awsaml-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="An application for providing automatically rotated temporary AWS credentials."
arch=('x86_64')
url="https://github.com/rapid7/awsaml"
license=('MIT')
providers=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://raw.githubusercontent.com/rapid7/awsaml/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('4348a14b68d16005efda32994d36e53a9ddd1817255c3531c0ad15c0d6590658'
            'db684cabe2f8e2118d953f6ecee9054018a1b7a7632c1d4a63d83371709f1b1f'
            '709d34eebcdb27ff0cee2d5808ad5ef50e4a2fe471c02e4fdbc38ce6038bf8a0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}