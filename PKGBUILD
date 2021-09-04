# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.8
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/bertob/nostalgia'
license=(GPL3)
depends=(
	libhandy
	libportal
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("https://gitlab.gnome.org/bertob/nostalgia/-/archive/$pkgver/nostalgia-$pkgver.tar.gz")
sha256sums=('e52425cb224886b4c5f973e50a829a8bca0931dd499ff26d773e804c50e82bf5')

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
