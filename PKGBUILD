# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=discord-history-tracker-bin
_pkgname=DiscordHistoryTracker
pkgver=47.0
pkgrel=1
pkgdesc="Desktop app & browser script that saves Discord chat history into a file, and an offline viewer that displays the file.(Prebuilt version)"
arch=('x86_64')
url="https://dht.chylex.com/"
_ghurl="https://github.com/chylex/Discord-History-Tracker"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
    'zlib'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/chylex/Discord-History-Tracker/v${pkgver}/app/Resources/Icons/256.png"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/chylex/Discord-History-Tracker/v${pkgver}/LICENSE.md"
)
sha256sums=('c963a406020567a3c13ff2eb0d912fda5c955003399fdc7ae82007eb80e9d9e1'
            '44042026cb69b982e6161587f394ec7d17a02d240adfb11f996f15c0b1e2503a'
            'd8c316ff6707f6cae3b874ed41b4c69c71d4aa52526abe4433927a0d06346115')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}