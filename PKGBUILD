# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=10.0.1
pkgrel=1
pkgdesc="A Home Assistant, native app integration for desktop/laptop devices."
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm7hf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('174d351e68988662fd85bae0ae7c9b1905b3d96f4dd3d3cc8a059885bfa7195a')
sha256sums_armv7h=('8efbb6bc715290119aa46031fac22f930abb78234818725dc50e2bb6a0857bcb')
sha256sums_x86_64=('f45b726e313c9b8b927ced307597e9df5152e4b247e068b6e621c92ddff97c83')
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