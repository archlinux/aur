# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.7
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
sha256sums=('0aef6ce90f9c97a8fe84ced9d604170752c9379b2b8ebb59b83dbe7700be1a2d')

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
