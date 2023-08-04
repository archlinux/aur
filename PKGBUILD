# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gchat
_appname=GChat
pkgver=1.0.1
pkgrel=2
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
            '659d2f3a7462ed330b7f13d66a344a1d98eb624db31edc58d5e7885d07e15917')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/dist/${_appname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/assets/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "Network" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}