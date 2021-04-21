# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

pkgname=dewobble-git
_pkgname=dewobble
pkgver=0.0.1.r36.gf440216
pkgrel=1
pkgdesc="Video stabilisation library with awareness of lens projections"
url="https://git.sr.ht/~hedgepigdaniel/dewobble"
arch=(x86_64)
license=(LGPL)
depends=(opencl-driver opencv gram-savitzky-golay)
makedepends=(git meson opencl-clhpp)
provides=(dewobble)
conflicts=(dewobble)
source=("git+https://git.sr.ht/~hedgepigdaniel/dewobble")
md5sums=('SKIP')


pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	if check_option debug y; then
		BUILD_TYPE=debugoptimized
	else
		BUILD_TYPE=plain
	fi
	arch-meson --buildtype $BUILD_TYPE build
}

build() {
	cd "$_pkgname"
	meson compile -C build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" meson install -C build
}

