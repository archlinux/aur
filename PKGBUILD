# Maintainer: Hexawolf <hexawolf@protonmail.com>
pkgname=swaylay-git
_pkgname=swaylay
pkgver=r10.7c24690
pkgrel=1
license=("MIT")
pkgdesc="Keyboard layouts monitoring utility for Sway WM"
makedepends=("meson" "ninja" "git")
depends=("json-c" "sway")
arch=("i686" "x86_64")
url="https://github.com/Hexawolf/swaylay"
source=("${pkgname%-*}::git+https://github.com/Hexawolf/swaylay.git")
sha512sums=('SKIP')
provides=("swaylay")
conflicts=("swaylay")
options=(strip)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	meson \
		--buildtype release \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
