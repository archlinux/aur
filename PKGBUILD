# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=nanoboyadvance
pkgbase="${_pkgbase}-git"
pkgname="${_pkgbase}-git"
pkgdesc="Accuracy-focused Game Boy Advance emulator."
pkgver=1.7.1.r53.gd5e47e52
pkgrel=1
arch=(x86_64)
url="https://github.com/nba-emu/NanoBoyAdvance"
license=(GPL3)
makedepends=(cmake git)
depends=(qt5-base glew sdl2 fmt)

source=("git+https://github.com/nba-emu/NanoBoyAdvance.git")
sha256sums=('SKIP')

pkgver() {
	cd NanoBoyAdvance
	git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/NanoBoyAdvance"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DPORTABLE_MODE=OFF \
		-DUSE_SYSTEM_FMT=ON \
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	cd "$srcdir/NanoBoyAdvance"

	DESTDIR="$pkgdir" cmake --install build
}
