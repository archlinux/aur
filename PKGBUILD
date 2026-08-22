# Maintainer: Okabe Zero-Link (okbzl) <okabezerolink@gmail.com>

pkgname=ai5-sdl2
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform implementation of elf's AI5WIN engine"
arch=(x86_64)
url="https://github.com/nunuhara/ai5-sdl2"
license=('GPL-2.0-only')
depends=(libpng libsndfile sdl2 sdl2_ttf ffmpeg)
makedepends=(meson git)
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
provides=("ai5=${pkgver}")
sha256sums=('SKIP')
prepare () {
	cd "$srcdir/${pkgname}"
	mkdir build
	git submodule init
	git submodule update
	cd subprojects/libai5
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/${pkgname}"
	meson setup build --prefix /usr
	ninja -C build
}

package() {
  cd "$srcdir/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install
}