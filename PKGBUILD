# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor-git
pkgver=44.0.r4.g4284fc9
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
provides=(gnome-text-editor)
conflicts=(gnome-text-editor)
depends=(
	editorconfig-core-c
	enchant
	'gtksourceview5>=5.4'
	'glib2>=2.73'
	libadwaita
)

makedepends=(
	git
	itstool
	meson
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
