# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=termitegame
pkgver=0.8
pkgrel=1
pkgdesc='The ultimate real-time strategy'
arch=('i686' 'x86_64')
url='https://github.com/milgra/termite'
license=('gplv3')
depends=('glew' 'sdl2' 'glu')
makedepends=('meson')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/termite/releases/download/${pkgver}/termite-${pkgver}.tar.xz"
)

sha256sums=(
	'c475e897d93d73e661c3f91febac3b60d00d3d6f94df974aba90ea3edeb91be0'
)

prepare() {
	cd "termite-${pkgver}"
}

build() {
	mkdir -p build
	arch-meson build "termite-${pkgver}" --buildtype=release
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
