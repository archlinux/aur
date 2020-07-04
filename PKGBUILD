# Mantainer: Dudemanguy <random342@airmail.cc>
# Contributer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=vmn-git
_pkgname=vmn
pkgver=0.4_5_g0b31dfd
pkgrel=1
license=("GPL3")
pkgdesc="Simplistic cli music player built on mpv and curses"
makedepends=("meson")
depends=("ffmpeg" "mpv" "ncurses")
optdepends=("scdoc: for manpages")
arch=("x86_64")
url="https://github.com/Dudemanguy/vmn"
source=("${_pkgname}::git+https://github.com/Dudemanguy/vmn.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --tags)" | sed s/-/_/g
}

build() {
	cd "$_pkgname"
	arch-meson --auto-features auto "$srcdir/build"
	meson compile -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" meson install -C "$srcdir/build"
}
