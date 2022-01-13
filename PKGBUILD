# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.9
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/bertob/nostalgia'
license=(GPL3)
depends=(
	libadwaita
	libportal-gtk4
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${url}/-/archive/${pkgver}/nostalgia-${pkgver}.tar.gz")
b2sums=('616bbeb2145d0d4fde6abd8918f20b5f915fb6de41f084f98028994ef235ab5b6df09119084eca37083ec51dad1d00ec3b03f87ad588086e33faf5d1af3a7796')

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
