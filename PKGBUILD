# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus
pkgver=4.8.6
pkgrel=4
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('any')
url="https://github.com/amanharwara/altus"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('yarn' 'npm' 'nodejs>=18.11.18' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('ca5cb6f78df1a04beb1113d152171db8d2bab7d41d65658ff511af4de9dc0171'
            '6b70548f28be57598013faceba7b82aaf5ffed534d049f90b3eb891e95b75cb0')
prepare() {
    gendesk -q -f -n --categories "Network" --name "Altus" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn
    yarn build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}