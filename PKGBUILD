# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

pkgname=dewobble
pkgver=1.0.1
pkgrel=1
pkgdesc="Video stabilisation library with awareness of lens projections"
url="https://git.sr.ht/~hedgepigdaniel/dewobble"
arch=(x86_64)
license=(GPL3)
depends=(opencl-driver opencv gram-savitzky-golay)
makedepends=(git meson opencl-clhpp)
source=("git+https://git.sr.ht/~hedgepigdaniel/dewobble#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	if check_option debug y; then
		BUILD_TYPE=debug
	else
		BUILD_TYPE=plain
	fi
	arch-meson --buildtype $BUILD_TYPE build
}

build() {
	cd "$pkgname"
	meson compile -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" meson install -C build
}

