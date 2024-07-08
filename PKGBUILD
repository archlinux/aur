# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=9.5.2
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm7hf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('4c79948fe3738d795ba56f5b0ce7622ed4a1f238804b3c4c478b51b03de0f621')
sha256sums_armv7h=('0a0af38335e96ec8bef69820c89c8256537ab888a3edf36410afc7e51b512942')
sha256sums_x86_64=('5f26d67fd707825fc4701b24bd971474263e0aafcd2e1f2796a122b6f44bc068')
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