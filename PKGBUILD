# Mantainer: Dudemanguy <random342@airmail.cc>
# Contributer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=vmn-git
pkgver=0.4.1+1+g82c2b99
pkgrel=1
pkgdesc="Simplistic cli music player built on mpv and curses"
url="https://github.com/Dudemanguy/vmn"
arch=(x86_64)
license=(GPL3)
depends=(ffmpeg mpv ncurses)
makedepends=(git meson scdoc)
source=("git+https://github.com/Dudemanguy/vmn.git")
sha512sums=('SKIP')

pkgver() {
	cd vmn
	git describe --tags | sed 's/-/+/g'
}

build() {
	export CFLAGS="-Wno-format-security"
	arch-meson vmn build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
