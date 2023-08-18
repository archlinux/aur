# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cycode
_appname=CyCode
pkgver=1.2.3
pkgrel=1
pkgdesc="A web-based HTML Editor, Markdown Editor, and WYSIWYG Editor, It is written in HTML, CSS, and JavaScript."
arch=('any')
url="https://github.com/magayagalabs/CyCode"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7d33bc557aa1ddb7ca4480fc1f534b49ce7155533b87c23392ee3c474038b30b'
            '646043ea4f07e7bab383e50914d1875cbb67074af8b267d0c2ddafc803ba152a')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run download-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/release-builds/${pkgname}-linux-"*/resources/app.asar "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "Development" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}