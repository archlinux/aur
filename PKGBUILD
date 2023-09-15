# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mater-bin
_pkgname=Mater
pkgver=1.0.10
pkgrel=4
pkgdesc="A simple menubar Pomodoro app"
arch=('x86_64')
url="https://github.com/jasonlong/mater"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.sh")
sha256sums=('b26d8ef79fd92c95ac914e73af9504f06dcfaa204f62c47cc3d423a53fa32f8a'
            '51a687bb47024892bf4a09a4301f839ccfd15bd12c69b3042fdc0957363fa674')
prepare() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/${_pkgname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}