# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=perplexity-ai-app
pkgver=0.1.1
pkgrel=1
pkgdesc="The Unofficial Perplexity AI Desktop App, powered by Electron which brings the magic of AI language processing to your desktop."
arch=('any')
url="https://github.com/inulute/perplexity-ai-app"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('e5998dad3514c51517418443f022f648c10265f3e3013534dcba1f34cc35e89e'
            '43c8b25e8db73f5c03da57ecfac062a680abf97b04940b30b6bbcf7ca5c82519')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release-builds/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/png/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}