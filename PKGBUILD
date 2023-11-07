# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bot.dev
pkgver=0.1.2
pkgrel=1
pkgdesc="Desktop app to manage Discord.js bots built with React, Electron and DaisyUI"
arch=('any')
url="https://github.com/juaneth/bot.dev"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron23'
)
makedepends=(
    'gendesk'
    'asar'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('369c78c100b26a3294a0ac8348fed1b0a5fa8b1bc391d4fe9fcd4d38579b0c11'
            'd34069e7fa0ea01f3931905ba9724946ad4b20835cf18349755a57906638a0f0')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run electron:package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}