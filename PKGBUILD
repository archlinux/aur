# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avda-bin
_pkgname='Aegis Vault Desktop'
pkgver=1.11.0
pkgrel=1
pkgdesc="A desktop app for viewing one-time passwords generated from Aegis Authenticator backups.(Written in GO,prebuilt version)"
arch=('x86_64')
url="https://github.com/Sammy-T/avda"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Sammy-T/avda/v${pkgver}/build/appicon.png"
)
sha256sums=('321990aac165e91defdbd2c7fb81c93bf946052ff75bfbb44b63d8c30ade1a27'
            'e83f71b586a1e3aaff6e91877a290433c49c40ff4dea526fd35ea1bc887b452b')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/build/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
