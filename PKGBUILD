#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=xsystem35-sdl2
pkgver=2.16.0
pkgrel=1
pkgdesc="This is a multi-platform port of xsystem35, a free implementation of AliceSoft's System 3.x game engine."
arch=(x86_64)
url="https://github.com/kichikuou/xsystem35-sdl2"
license=('GPL-2.0-only')
depends=(gtk3 sdl2 sdl2_ttf sdl2_mixer libwebp portmidi cjson asciidoctor)
makedepends=(cmake)
conflicts=(xsystem35)
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=('1315289ca3bd7570cfd81b5def65298970eeb31a4b1d25af7512ff9e8203be99')
prepare () {
	cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	mkdir -p out/debug
	cd out/debug
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ../../
	make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/out/debug"
  make DESTDIR="${pkgdir}" install
}
