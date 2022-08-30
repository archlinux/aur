# Maintainer: Herman Rimm <herman_rimm at pm dot me>
pkgname=rpi-fbcp-git
pkgver=r14.af8d322
pkgrel=1
pkgdesc="Copy dispmanx display to framebuffer."
arch=(aarch64 arm7h)
url="https://github.com/tasanakorn/rpi-fbcp.git"
license=('MIT')
depends=(raspberrypi-firmware)
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/tasanakorn/rpi-fbcp.git
		"${pkgname%-git}".service)
sha256sums=('SKIP'
			'52739086cec44a635cf345897304fecf16863ffa1fb54c7ef20e8cfbd7eb97c4')
pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cmake "${pkgname%-git}"
	make
}
package() {
	install -Dm755 fbcp "${pkgdir}"/usr/bin/"${pkgname%-git}"
	install -Dm644 "${pkgname%-git}".service "${pkgdir}"/usr/lib/systemd/system/"${pkgname%-git}".service
	cd "${pkgname%-git}"
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
