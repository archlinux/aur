# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=icon-library-git
pkgver=0.0.8.r73.g58d0a7f
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/design/icon-library'
license=(GPL3)
depends=(
	gtksourceview5
	libadwaita
)
makedepends=(
	git
	meson
	rust
)
checkdepends=(appstream-glib)
provides=(icon-library)
conflicts=(icon-library)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd icon-library
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson icon-library build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
