#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=xsystem35-sdl2
pkgver=2.16.1
pkgrel=2
pkgdesc="This is a multi-platform port of xsystem35, a free implementation of AliceSoft's System 3.x game engine."
arch=(x86_64)
url="https://github.com/kichikuou/xsystem35-sdl2"
license=('GPL-2.0-only')
depends=(gtk3 sdl2 sdl2_ttf sdl2_mixer libwebp portmidi cjson)
makedepends=(cmake asciidoctor)
source=("${pkgname}::git+https://github.com/kichikuou/xsystem35-sdl2.git#tag=v${pkgver}")
sha256sums=('SKIP')
conflicts=(xsystem35)
provides=("xsystem35=${pkgver}")
prepare () {
	cd "$srcdir/${pkgname}"
	mkdir -p out/debug
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
