# Mantainer: Dudemanguy <random342@airmail.cc>
# Contributer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=vmn-git
_pkgname=vmn
pkgver=0.4_b25ae8e
pkgrel=1
license=("GPL3")
pkgdesc="Simplistic cli music player built on mpv and curses"
makedepends=("meson" "scdoc" "ninja")
depends=("ffmpeg" "mpv" "ncurses")
optdepends=()
arch=("x86_64")
url="https://github.com/Dudemanguy/vmn"
source=("${_pkgname}::git+https://github.com/Dudemanguy/vmn.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s_%s" "$(git describe --tags)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
