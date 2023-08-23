# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=loopy-desktop
pkgver=1.2.1
pkgrel=1
pkgdesc="A tool for thinking in systems"
arch=('any')
url="https://github.com/jchu634/loopy-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
makedepends=('gendesk' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('964320fde15be102235feac8e2e1bab115e8fcfe8245645d5411dac114446f27'
            '000a01f03b4c094ac44e85b1a0301538db831f1a4ae6ec8a0d9f86efd19c3903')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/_icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}