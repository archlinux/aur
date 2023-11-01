# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.11
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	libipuz
	python-beautifulsoup4
	python-lxml
	python-puzpy
	python-regex
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/crosswords-${_commit}.tar.gz")
b2sums=('eec4efa6693144aca4656a0d9b0c780e720c86152a42b5dc8f627d88708b96e4a369ca757be8eb422d9bcfa5bae65930c080f651dca47efa2f7c28f8fd51e71e')

build() {
	arch-meson ${pkgname}-${_commit} build -Ddevelopment=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
