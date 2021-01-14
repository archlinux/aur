# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.6
pkgrel=1
pkgdesc="Set historic GNOME wallpapers"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/bertob/nostalgia"
license=(GPL3)
depends=(libhandy)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("https://gitlab.gnome.org/bertob/nostalgia/-/archive/$pkgver/nostalgia-$pkgver.tar.gz")
sha256sums=('b7706e7ae34eee4b1de826f6a9daab1ecc9dc60eae9eeb12c0dcb19214959ea3')

build() {
	arch-meson nostalgia-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
