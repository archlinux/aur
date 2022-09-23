# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.21.0
pkgrel=1
pkgdesc='Simple tour through phosh'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/guidog/phosh-tour'
license=(GPL3)
depends=(
	libadwaita
)
makedepends=(
	git
	meson
)
_tag=808b07bdb7f56d315e71390c4854bfb39f983739
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phosh-tour
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phosh-tour

	git submodule init
	git submodule update
}

build() {
	arch-meson -Dvendor="Arch Linux" -Dbrand="Librem 5/Pinephone" phosh-tour _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
