#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=system3-sdl2
pkgver=1.6.2
pkgrel=1
pkgdesc="SDL2 port of AliceSoft's System3 game engine."
arch=(x86_64)
url="https://github.com/kichikuou/system3-sdl2"
license=('GPL-2.0-only')
depends=(sdl2 sdl2_ttf sdl2_mixer rtmidi)
makedepends=(cmake nlohmann-json)
provides=("system3=${pkgver}")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
prepare () {
	cd "$srcdir/${pkgname}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname}"
	mkdir -p out/debug
	cd out/debug
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ../../
	make
}

package() {
  cd "$srcdir/${pkgname}/out/debug"
  make DESTDIR="${pkgdir}" install
}
