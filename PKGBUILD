# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.14.0+fdb288c8
pkgrel=1
pkgdesc='Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone'
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(
	feedbackd
	gnome-desktop
	python
)
makedepends=(
	pkg-config
	meson
	intltool
	rust
	gtk-doc
)
_commit=fdb288c836acd01a30c88dae2346f543113cc3b5
source=("${url}/-/archive/${_commit}/squeekboard-${_commit}.tar.gz")
sha256sums=('6aaef29aec83762c80e35a95b2739e2bd4f2a9b36893cfa05ba264a28a13f0f2')

build() {
	arch-meson "squeekboard-${_commit}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
