# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gchat
_pkgname=GChat
pkgver=1.0.1
pkgrel=3
pkgdesc="Unofficial Google Chat app"
arch=('x86_64')
url="https://github.com/dcrousso/GChat"
license=('MIT')
depends=('electron23' 'hicolor-icon-theme' 'bash')
mkdenpends=('npm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('6ac16d881642d156d9e3c01367edba538cde61efef2c46d07be0e504a42199bf'
            '3065e9082cc84406701ceb93a1c9254fa723dc58fe39672655de1b842c6b605e')
prepare() {
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}