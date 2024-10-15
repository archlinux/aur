# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=10.3.2
pkgrel=1
pkgdesc="A Home Assistant, native app integration for desktop/laptop devices.Written in Go.Prebuilt version."
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('841f66db5dbe6a67c99a27a48ca72d8d7256892171d3337157ebb1214029bcd1')
sha256sums_armv7h=('233d7c25a4a3a688d4caa70d55fe5fe475df83d2983d9c051aa772cae6beb4e9')
sha256sums_x86_64=('f4a070f0ce46840c08945a05e294d3b63c8d8f22c857014537e9ead7fe3d751b')
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