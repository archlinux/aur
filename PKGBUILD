# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bcrypt-sandbox-bin
_pkgname="Bcrypt Sandbox"
pkgver=1.0.0
pkgrel=5
pkgdesc="A tool for encrypting and validating text with bcrypt"
arch=('x86_64')
url="https://felladrin.github.io/bcrypt-sandbox"
_ghurl="https://github.com/felladrin/bcrypt-sandbox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/felladrin/bcrypt-sandbox/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9b1675cb7f13d3bfa2ade85fd0821c42d106d23b7e7b66e8682dc256a5a0b61d'
            '9fefa7c0ffe3e72fa6f422498c7a892ba6ef9360e84f3892448c2ebe9d04ba70'
            'a7a7eb694d780ef170cd9b00fdc71ffa29b44d73ecb8b6eb6554e7836d4e00e5')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility;System" --name "${_pkgname}" --exec "${pkgname%-bin}"
    chmod 755 "${srcdir}/${_pkgname}/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/storage/iconfile.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}