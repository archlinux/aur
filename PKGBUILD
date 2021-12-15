# Mantainer: Dudemanguy <random342@airmail.cc>
# Contributer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=vmn-git
pkgver=0.4.1
pkgrel=1
pkgdesc="Simplistic cli music player built on mpv and curses"
url="https://github.com/Dudemanguy/vmn"
arch=(x86_64)
license=(GPL3)
depends=(ffmpeg mpv ncurses)
makedepends=(git meson scdoc)
_commit=302896226dcc41d83928385d26dd438b326e174c  # tags/0.4.1^0
source=("git+https://github.com/Dudemanguy/vmn.git#commit=$_commit")
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
