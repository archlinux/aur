# Maintainer: Vicente Reyes <vreyesvaldivieso@gmail.com>
pkgname=vmn-git
_pkgname=vmn
pkgver=r198.327b24c
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
