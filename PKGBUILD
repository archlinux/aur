# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-mobile-settings
pkgver=0.21.0
pkgrel=1
pkgdesc='A settings app for mobile specific things'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/guidog/phosh-mobile-settings'
license=(GPL3)
depends=(
	feedbackd
	libadwaita
	lm_sensors
	phoc
)
makedepends=(
	git
	meson
	wayland-protocols
)
_tag=fd59bbabe3452bac7ed203af3d0281c29c84ac79
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phosh-mobile-settings
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phosh-mobile-settings
}

build() {
	arch-meson phosh-mobile-settings _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
