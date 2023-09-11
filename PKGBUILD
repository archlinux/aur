# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bcrypt-sandbox-bin
_pkgname="Bcrypt Sandbox"
pkgver=1.0.0
pkgrel=3
pkgdesc="A tool for encrypting and validating text with bcrypt"
arch=('x86_64')
url="https://felladrin.github.io/bcrypt-sandbox"
_githuburl="https://github.com/felladrin/bcrypt-sandbox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'gtk3' 'glibc' 'webkit2gtk' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.zip"
        "LICENSE::https://raw.githubusercontent.com/felladrin/bcrypt-sandbox/v${pkgver}/LICENSE")
sha256sums=('9b1675cb7f13d3bfa2ade85fd0821c42d106d23b7e7b66e8682dc256a5a0b61d'
            '9fefa7c0ffe3e72fa6f422498c7a892ba6ef9360e84f3892448c2ebe9d04ba70')
prepare() {
    gendesk -f -n --categories "Utility;System" --name "${_pkgname}" --exec "${pkgname%-bin}"
    chmod 755 "${srcdir}/${_pkgname}/${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/storage/iconfile.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}