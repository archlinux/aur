# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cycode
_pkgname=CyCode
pkgver=1.2.3
pkgrel=2
pkgdesc="A web-based HTML Editor, Markdown Editor, and WYSIWYG Editor,written in HTML, CSS, and JavaScript."
arch=('any')
url="https://github.com/magayagalabs/CyCode"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7d33bc557aa1ddb7ca4480fc1f534b49ce7155533b87c23392ee3c474038b30b'
            'b68cd08cf439ecd0eb333674bee244bf481c8da12ed936c4cc2ffc6adeac5078')
prepare() {
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run download-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/release-builds/${pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}