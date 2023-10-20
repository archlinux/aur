# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snsdeck
pkgver=0.0.3
pkgrel=2
pkgdesc="SNS Viewer like TweetDeck"
arch=('x86_64')
url="https://github.com/meganii/snsdeck"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm>=9.6.7' 'nodejs>=18.17.1')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('b780dee61d93ddd2e1d7a0ca061586323f82891b55e25db6b85de6cd8614447b'
            '70dd74465183fb0f84466db93b8678362caf0aced37b3ba2c6abfd385ee145de')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '16,23d' -i forge.config.js
    npm install
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}