# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=craze
pkgver=0.1.4
pkgrel=1
pkgdesc="Access all the developer tools you need, free and open source, on any platform!"
arch=('any')
url="https://github.com/craze-app/craze"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'yarn' 'nodejs>=14.18.0')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('608a40ad03421e042242ab008c2988ead7a35a9bf54dddb89d8519deb89719c3'
            '92182264140122aadd6678a2ba858897e6e37c24728872f09e7dc1ecbf6c9cbe')
build() {
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn
    yarn build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/favicon-256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}