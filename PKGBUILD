# Maintainer: Ghassan Alduraibi <git@ghassan.dev>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.22.0
pkgrel=1
pkgdesc='An on-screen-keyboard input method for Wayland'
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
b2sums=('b1cadc8ad2bcdf6fb4e408c75aea90cccbaafce4580f464dc85a6ac0a3a801ba495423e7945859dd536cc9f60985d289938a710d093d3b94b8ae0f26c1f37e1f')

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
