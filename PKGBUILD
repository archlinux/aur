# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.17.0
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh'
license=(GPL3)
depends=(
	callaudiod
	feedbackd
	libhandy
	phoc
	polkit
)
makedepends=(
	ctags
	git
	meson
	vala
	wayland-protocols
)
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
)
b2sums=('SKIP' 'SKIP')

prepare() {
	cd phosh

	git submodule init
	git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
	git submodule update
}

build() {
	arch-meson phosh build # -D gtk_doc=true
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
