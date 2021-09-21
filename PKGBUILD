# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=41.0
pkgrel=1
pkgdesc='Phone dialer and call handler'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/calls'
license=(GPL3)
depends=(
	callaudiod
	feedbackd
	folks
	gom
	libhandy
	libpeas
	modemmanager
	sofia-sip
)
makedepends=(
	gobject-introspection
	meson
	vala
)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/calls-${_commit}.tar.gz")
sha256sums=('c6ccd265f4eec611eaac3b3920fd1127179d1946adcd2a4adfca9c304168b01f')

build() {
	arch-meson calls-${_commit} build -D tests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
