# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rats-search-bin
_pkgname="Rats on The Boat"
pkgver=1.11.0
pkgrel=3
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client."
arch=('x86_64')
url="https://github.com/DEgITx/rats-search"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'at-spi2-core' 'alsa-lib' 'lib32-gcc-libs' 'nss' 'openssl-1.1' 'lib32-zlib' 'glibc' 'cairo' \
    'mesa' 'zlib' 'libxcb' 'dbus' 'libxkbcommon' 'libxfixes' 'libxcomposite' 'libcups' 'nspr' 'libdrm' 'expat' \
    'libxext' 'lib32-glibc' 'libxdamage' 'pango' 'libx11' 'libxrandr' 'glib2' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/DEgITx/rats-search/v${pkgver}/LICENSE")
sha256sums=('012c03571f9083d13bedf925bdf4e478e2f6d102caac981d90a455a57da3922d'
            'fa6a25af037d88ee811669579da9674e5694611599600b11e691115054f6fe2f')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}