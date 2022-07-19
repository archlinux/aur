# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-git
pkgver=0.3.3+5+ga15bbb0
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita-git
	libipuz
	python
)
makedepends=(git meson)
source=("git+${url}.git")
b2sums=(SKIP)

pkgver() {
 	cd crosswords
 	git describe --tags | sed 's/-/+/g'
}

build() {
	arch-meson crosswords build -Ddevelopment=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
