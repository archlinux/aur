# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytm-dlp-gui
pkgver=1.0.2
pkgrel=1
pkgdesc="An ElectronJS app for downloading music off Youtube Music."
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm' 'asar' 'nodejs' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('8079dba2c6bb018670bb1c6e6cc1e6ff047507c75548a26b64e1b55f16fe6a5d'
            '2584f1c5c6b586d3dd2257bc08d838831d181c191fbfcb07f05375267785872e')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '46,49d' -i forge.config.js
    npm ci
    npm run make
    convert "${srcdir}/${pkgname}-${pkgver}/images/icon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.0.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
