# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elements-latex
_pkgname=Elements-LaTeX
pkgver=0.0.3_stable
pkgrel=1
pkgdesc="A cross-platform, powerful electron-based LaTeX editor"
arch=('any')
url="https://github.com/Red-Rapious/Elements-LaTeX"
license=('CC-BY-NC-SA-4.0')
conflicts=("${pkgname}")
depends=('bash' 'electron18')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/Red-Rapious/Elements-LaTeX/master/LICENSE"
    "${pkgname}.sh")
sha256sums=('447fa0de8dba9cca3f116ba6aa7ac35600dba5ab57cf3e8c18eebbba971a9151'
            '5b8e7938e1b5e0a675869ffe429cc8e7cc187d76a7c6ea1e0546c412782a43da'
            'c6fdcd0fe033a1eccc358914bbcb68f19e0f6bf39f456a6e273366134c360817')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/assets/logos/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}