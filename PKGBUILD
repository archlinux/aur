# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel
pkgver=0.1.4
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
sha256sums=('c2589aca93d45b016738d2b0124e3fbe9f6565c9d89c91c68dbe70a10ecb2ecc')

build() {
	export CGO_ENABLED=0
	cd "${pkgname}-${pkgver}"
	go build -v -o "${pkgname}" "./cmd/${pkgname}"
	go build -v -o "${pkgname}-client" "./cmd/${pkgname}-client"
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${pkgname}-${pkgver}/${pkgname}-client" "${pkgdir}/usr/bin/${pkgname}-client"
}

# vim:set ts=2 sw=2 et:
