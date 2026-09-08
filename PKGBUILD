# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=wayoled
pkgver=0.2.0
pkgrel=1
pkgdesc="OLED care daemon for wlroots Wayland compositors."
arch=('x86_64')
url="https://github.com/Youwes09/WayOLED"
license=('MIT')
depends=('wayland' 'glibc')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e65160b250d4a071bbe5009819bee8d990e93cad4130f69c40037eb06bbac0f')

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
