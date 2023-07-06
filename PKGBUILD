# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="altus"
pkgver=4.8.6
pkgrel=2
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('any')
url="https://github.com/amanharwara/altus"
license=('GPL3')
conflicts=("${pkgname}" "${pkgname}-appimage")
depends=('electron')
makedepends=('yarn' 'electron' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('ca5cb6f78df1a04beb1113d152171db8d2bab7d41d65658ff511af4de9dc0171'
            '6f76a2f84efdcd3fb28df7fd0ac9db343a11f9fd62332cdfb9744a8909304310')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
}
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Network" --name "Altus" --exec "/opt/${pkgname%}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}