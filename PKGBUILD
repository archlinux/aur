# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=feedbackd-git
pkgver=0.0.2.r9.g3a09ea5
pkgrel=1
pkgdesc="A daemon to provide haptic, visual, and audio feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3)
arch=(i686 x86_64 armv7h aarch64)
provides=(feedbackd)
conflicts=(feedbackd)
depends=(
	dconf
	gsound
	json-glib
	libgudev
)
makedepends=(
	git
	gobject-introspection
	meson
	vala
	gi-docgen
	python-docutils
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd feedbackd
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson feedbackd build -Dgtk_doc=true -Dman=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
