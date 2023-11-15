# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-calender-widget
pkgver=1.1.2
pkgrel=2
pkgdesc="An unofficial google calendar desktop widget for Windows, Mac and Linux"
arch=('x86_64')
url="https://github.com/p32929/google-calender-widget"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('b07a8d19e307d24b301f180d9fc3498c183c7c3a2abad28a296b698ba2ff77ac'
            '14248e5c12623a1f091b5638e6151094ac3ec22216cde7fea38b95b268db92e3')
build() {
    gendesk -q -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/"* -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}