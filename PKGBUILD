# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.17.0
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
b2sums=('420c2415b16fe996f39727eef7fa045bd3f31c7ad90723a2dc77afaddfbd7f9c84320da10e74d5a79bb728ba0370712b97262b64c018a7c52c0d80d5c6c0cd00')

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
