# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=9.4.0
pkgrel=1
pkgdesc="A Home Assistant， native app integration for desktop/laptop devices."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'libglvnd'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('4cf29e66f4dc39b56ad340416bd3ce94505f2623c938b1abd73952fbbc34a8a9')
sha256sums_armv7h=('4be4813a51b759d00e19e1c6365190093b232335b149523bc160fc997328ba34')
sha256sums_x86_64=('9935de80ddeb03ff566c4c1759ccc942b2436f273a79c71bf30614d06f489511')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}