# Maintainer: Alexander Kempen <alexander dot kempen at posteo dot de>
pkgname=wayvnc-git
_pkgname=wayvnc
pkgver=r66.ffce795
pkgrel=1
license=("ISC")
pkgdesc="This is a VNC server for wlroots based Wayland compositors."
makedepends=("meson" "git" "ninja")
depends=("libuv" "libxkbcommon" "pixman" "neatvnc-git")
optdepends=()
arch=("i686" "x86_64")
url="https://github.com/any1/wayvnc"
source=("${_pkgname%-*}::git+https://github.com/any1/wayvnc.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson \
		--buildtype=release \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
