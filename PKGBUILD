# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia-git
pkgver=0.9.r0.g402fe35
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/bertob/nostalgia'
license=(GPL3)
provides=(nostalgia)
conflicts=(nostalgia)
depends=(
	libadwaita
	libportal-gtk4
)
makedepends=(
	git
	gobject-introspection
	meson
	vala
)
source=("git+${url}.git")
b2sums=('SKIP')

build() {
	arch-meson nostalgia build
	meson compile -C build
}

pkgver() {
	cd nostalgia
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
