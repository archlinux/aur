# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=squeekboard
pkgname=squeekboard-git
pkgver=1.17.0.r4.gbd39089
pkgrel=1
pkgdesc='Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL3)
depends=(
	feedbackd
	gnome-desktop
	python
)
makedepends=(
	git
	meson
	intltool
	rust
	gtk-doc
	wayland-protocols
)
provides=(squeekboard)
conflicts=(squeekboard)
source=("git+https://gitlab.gnome.org/World/Phosh/squeekboard.git")
b2sums=("SKIP")


pkgver() {
    cd squeekboard
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
	arch-meson "$_pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
