# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.18.0
pkgrel=1
pkgdesc='Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL3)
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
	wayland-protocols
)
_commit=v${pkgver}
source=("${url}/-/archive/${_commit}/squeekboard-${_commit}.tar.gz")
b2sums=('ffa10032e46d77a6ad1a8cd17b095ffaca07798a79147bceb89bc9f6e56e9cebe9ac2f06a01c81fd33e9af9266ffe4482989b55459d130f81c81c62a898a1ed1')

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
