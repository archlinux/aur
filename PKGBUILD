# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.6
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	libipuz
	python-argparse
	python-beautifulsoup4
	python-lxml
	python-regex
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/crosswords-${_commit}.tar.gz")
b2sums=('a510b1fd1bbe36860d4719fe752645338c2be8857a8bfef12fa7665f25ff6dea7d94f932ccaa6fe170607542b894804a23a1f99aa9e2bc1aa90b2f63bae65b2a')

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
