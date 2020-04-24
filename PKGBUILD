# Maintainer: Alexander Kempen  <alexander dot kempen at posteo dot de>
pkgname=neatvnc-git
_pkgname=neatvnc
pkgver=r123.6bb3362
pkgrel=1
license=("ISC")
pkgdesc="This is a liberally licensed VNC server library that's intended to be fast and neat. Note: This is a beta release, so the interface is not yet stable."
makedepends=("meson" "git" "ninja" "libdrm")
depends=("libuv" "libxkbcommon" "pixman" "aml-git")
optdepends=("libjpeg-turbo")
arch=("i686" "x86_64")
url="https://github.com/any1/neatvnc"
source=("${pkgname%-*}::git+https://github.com/any1/neatvnc.git")
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
