# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor-git
pkgver=3.39.92.r43.gb506ba1
pkgrel=1
pkgdesc="Simple text editor that focuses on session management"
url="https://gitlab.gnome.org/chergert/gnome-text-editor"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
provides=(gnome-text-editor)
conflicts=(gnome-text-editor)
depends=(gtksourceview5 libadwaita)
makedepends=(git meson)
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
