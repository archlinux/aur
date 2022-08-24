# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=r6.e6f0951
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
_tag=e6f0951b1d4dda43037cfde54e698d3b2af84c6a
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phosh-tour
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd phosh-tour

	git submodule init
	git submodule update
}

build() {
	arch-meson -Dvendor="Arch" -Dbrand="Librem 5/Pinephone" phosh-tour _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
