#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=xsystem35-sdl2
pkgver=2.20.0
pkgrel=1
pkgdesc="This is a multi-platform port of xsystem35, a free implementation of AliceSoft's System 3.x game engine."
arch=(x86_64)
url="https://github.com/kichikuou/xsystem35-sdl2"
license=('GPL-2.0-or-later')
depends=(sdl2 sdl2_mixer libwebp portmidi cjson freetype2)
makedepends=(cmake asciidoctor)
source=(xsystem35-sdl2-${pkgver}::"${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('9d81c972dd75d30e98b9ffb5832ee0b5a99cb0edd6bdb26b6e0acd7ea12d55d9')
conflicts=(xsystem35)
provides=("xsystem35=${pkgver}")
build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	mkdir -p out/debug
	cd out/debug
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ../../
	make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"/out/debug
  make DESTDIR="${pkgdir}" install
}
