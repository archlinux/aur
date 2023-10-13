# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=loopy-desktop
pkgver=1.2.1
pkgrel=2
pkgdesc="A tool for thinking in systems"
arch=('any')
url="https://github.com/jchu634/loopy-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
makedepends=('gendesk' 'yarn' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('964320fde15be102235feac8e2e1bab115e8fcfe8245645d5411dac114446f27'
            '2d6f5f8f18426ce969673d3ab6422da092044974294d9e347284a11adf2be6db')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    1yarn install
    yarn dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/_icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}