# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.16.0
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
b2sums=('9ca5e48521397b6825d6d75410d1af4e7858c4ab95c2a16eee581f83dcb0cffef08ceb55bb13b73a63fb6445bfec5c80aa4def392f95cccb0d26e69a6d02b4e4')

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
