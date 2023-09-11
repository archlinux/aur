# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chrolog-bin
pkgver=1.5.0
pkgrel=4
pkgdesc="A automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('4ba773a11f93fe66357605f403517e0326aa67201cd25a7fbe1a0919236e21f6'
            '837842154eafcc8e2cacb4f4f13252833f3aefccc4dbf608ec80804a637c136b')
prepare() {
    gendesk -f -n --categories "Utility" --name "Chrolog" --exec "${pkgname%-bin}"
    asar e "${srcdir}/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/resources/resources" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}