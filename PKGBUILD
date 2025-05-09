# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=web_value_tracker
pkgname="${_appname//_/-}-bin"
_pkgname='Web Value Tracker'
pkgver=1.0.2
pkgrel=2
pkgdesc="Track any value on the web and get notified when it changes. Example: product prices on eBay, Amazon etc.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/Ashu999/web-value-tracker"
license=(
    'MIT'
    'Apache-2.0'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source=(
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/Ashu999/web-value-tracker/v${pkgver}/LICENSE-MIT"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Ashu999/web-value-tracker/v${pkgver}/assets/icon-1024.png"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_appname}-aarch64-unknown-linux-gnu")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_appname}-armv7-unknown-linux-gnueabihf")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_appname}-x86_64-unknown-linux-gnu")
sha256sums=('23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            '87c993335fd0b0bf16a276627d205ebd703c2a9a762035973cef8032cd4df6e3')
sha256sums_aarch64=('b24615cc388f66e63ca60a48d74ddcd74893d6ec4bc31b95f9267ea2fc9de239')
sha256sums_armv7h=('27c5182a774e9af5d75be46df465cfdf04f32fe5b47435d0fe64a82ff7defa87')
sha256sums_x86_64=('aa6f2d21004924f5b789a2c357f03e14d5860cdfbaf7f6e0b6dd0d1cc9f92935')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}