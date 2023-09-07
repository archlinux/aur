# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
_appname="AviUtl Package Manager"
pkgver=3.7.0
pkgrel=2
pkgdesc="A software that assists in the installation of AviUtl itself and its plugins and scripts."
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_githuburl="https://github.com/team-apm/apm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/AviUtl.Package.Manager-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/team-apm/apm/v${pkgver}/icon/apm256.png"
    "${pkgname%-bin}.sh")
sha256sums=('18596b162eb3b1ee6e6f6f5747e8adbea9041be9ec55a50dee9f58f0dabe1971'
            '7b59d53b7a0d52c6885f52fe28fba7a3353ca8362f82ec0084f9652dff2d9b5e'
            'd726aaa121e23f04202a3a8e45ab9cd015d4da816fd7beadafe7c7c35caf9fda')
prepare() {
    asar extract "${srcdir}/${_appname}-linux-x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_appname}-linux-x64/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}