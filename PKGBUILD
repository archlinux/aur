# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-mobile-settings
pkgver=0.20.0
pkgrel=1
pkgdesc='A settings app for mobile specific things'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/guidog/phosh-mobile-settings'
license=(GPL3)
depends=(
	libadwaita
	phosh
)
makedepends=(
	git
	meson
)
_tag=8ed7889c05f45970b5f228d93386007027c69a3b
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phosh-mobile-settings
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phosh-mobile-settings

	git submodule init
	git submodule update
}

build() {
	arch-meson phosh-mobile-settings _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
