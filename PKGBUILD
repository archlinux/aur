# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-git
pkgver=0.1.3.r11.g1f00701
pkgrel=2
pkgdesc="An opensource project that aims to create a Graphical UI to help manage Linux overlays."
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('gtk2')
makedepends=('git' 'lazarus')
optdepends=('mangohud')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	lazbuild \
		--lazarusdir=/usr/lib/lazarus \
		--build-all \
		goverlay.lpi
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
