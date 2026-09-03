# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=wayoled
pkgver=0.1.0
pkgrel=1
pkgdesc="OLED care daemon for wlroots Wayland compositors."
arch=('x86_64')
url="https://github.com/Youwes09/WayOLED"
license=('MIT')
depends=('wayland' 'glibc')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97c8fe55dadede9152e57129bf6f633f1554a5c314dac412d7807ede4f9c43b5')

prepare() {
	cd "$srcdir/WayOLED-${pkgver}"
}

build() {
	cd "$srcdir"
	arch-meson build WayOLED-${pkgver}
	meson compile -C build
}

package() {
	cd "$srcdir/WayOLED-${pkgver}"
	meson install -C "$srcdir/build" --destdir "${pkgdir}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
