# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rats-search-bin
_pkgname="Rats on The Boat"
pkgver=1.11.0
_electronversion=24
pkgrel=7
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client."
arch=('x86_64')
url="https://github.com/DEgITx/rats-search"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'nss'
    'gtk3'
    'alsa-lib'
    'openssl-1.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/DEgITx/rats-search/v${pkgver}/LICENSE"
)
sha256sums=('012c03571f9083d13bedf925bdf4e478e2f6d102caac981d90a455a57da3922d'
            'fa6a25af037d88ee811669579da9674e5694611599600b11e691115054f6fe2f')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/opt/${_pkgname}/ia32"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}