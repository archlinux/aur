# Maintainer: Cédric Bellegarde

pkgname=power-profile-selector-git
pkgver=0.7.r0.g5c6d1d4
pkgrel=1
pkgdesc='This systemd user service monitors your system and apply wanted power profile.'
arch=(any)
url=https://gitlab.gnome.org/gnumdk/power-profile-selector
license=(GPL)
depends=(
	glib2
	python-gobject
	python-psutil
    power-profiles-daemon
)
makedepends=(
	git
	gobject-introspection
	meson
)
optdepends=(
    mutter
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/gnumdk/${pkgname%-git}")
install=power-profile-selector.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'   
}

build() {
	arch-meson power-profile-selector build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}

md5sums=('SKIP')
