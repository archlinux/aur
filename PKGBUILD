# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor-git
pkgver=42.alpha1.r30.g3cbb331
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=('GPL3')
arch=(x86_64 aarch64)
provides=(gnome-text-editor)
conflicts=(gnome-text-editor)
depends=(
	enchant
	glib2
	'gtksourceview5>=5.3.0'
	libadwaita
)
makedepends=(
	git
	itstool
	meson
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd gnome-text-editor
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson gnome-text-editor build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
