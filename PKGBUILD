# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=43.0
pkgrel=1
pkgdesc='Phone dialer and call handler'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/calls'
license=(GPL3)
depends=(
	callaudiod
	evolution-data-server
	feedbackd
	folks
	gom
	libhandy
	libpeas
	modemmanager
	sofia-sip
)
makedepends=(
	git
	gobject-introspection
	meson
	vala
)
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://gitlab.gnome.org/World/Phosh/libcall-ui.git"
)
b2sums=('SKIP'
        'SKIP')

prepare() {
	cd $pkgname

	git submodule init
	git submodule set-url subprojects/libcall-ui "../libcall-ui"
	git -c protocol.file.allow=always submodule update
}


build() {
	cd $pkgname
	arch-meson . _build
	ninja -C _build
}

package() {
	cd $pkgname

	DESTDIR="${pkgdir}" ninja install -C _build
}
