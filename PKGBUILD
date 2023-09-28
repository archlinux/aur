# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: RubenKelevra <cyrond@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor-git
pkgver=45.0.r4.g67aa1bf
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
provides=(gnome-text-editor)
conflicts=(gnome-text-editor)
depends=(
	editorconfig-core-c
	libenchant-2.so
	'glib2>=2.73'
	'gtk4>=4.10'
	'gtksourceview5>=5.6'
	'libadwaita>=1.4'
)

makedepends=(
	git
	meson
	yelp-tools
)

options=(debug)
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

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
