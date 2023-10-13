# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elements-latex
_pkgname=Elements-LaTeX
pkgver=0.0.3_stable
pkgrel=2
pkgdesc="A cross-platform, powerful electron-based LaTeX editor"
arch=('any')
url="https://github.com/Red-Rapious/Elements-LaTeX"
license=('CC-BY-NC-SA-4.0')
conflicts=("${pkgname}")
depends=('bash' 'electron18')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('447fa0de8dba9cca3f116ba6aa7ac35600dba5ab57cf3e8c18eebbba971a9151'
            '4afc2774225d164de54bad329e42588ef2766538f84910a3961af07562f068f2')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/assets/logos/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}