# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel
pkgver=0.1.2
pkgrel=1
pkgdesc="An opinionated panel/shell for the Hyprland compositor."
arch=('x86_64' 'aarch64')
url="https://github.com/pdf/hyprpanel"
license=('MIT')
options=('!strip')
depends=('gtk4' 'gtk4-layer-shell' 'hyprland')
optdepends=('systemd: logging support'
	'pulse-native-provider: volume control support'
	'upower: battery status support')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
	export CGO_ENABLED=0
	cd "${pkgname}-${pkgver}"
	go build -o "${pkgname}" "./cmd/${pkgname}"
	go build -o "${pkgname}-client" "./cmd/${pkgname}-client"
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}-client" "${pkgdir}/usr/bin/${pkgname}-client"
}

# vim:set ts=2 sw=2 et:
sha256sums=('43b88a20a25acd5d2a2fa8eab50d158ff849c977a4cfe548008db65324d86922')
