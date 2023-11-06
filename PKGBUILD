# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=perplexity-ai-app
pkgver=1.0.0
pkgrel=1
pkgdesc="The Unofficial Perplexity AI Desktop App, powered by Electron which brings the magic of AI language processing to your desktop."
arch=('any')
url="https://github.com/inulute/perplexity-ai-app"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron22'
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('5087ac9aafba243ee12fd7a21baf58815170b063ea070a44dfbc9640d88d6045'
            '7963c0e517f051afffe3ec7dafd39392afb3538658053f497e506995e005b5ad')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force
    npm run package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release-builds/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/png/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}