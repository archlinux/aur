# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=cortex
pkgver=0.8
pkgrel=1
pkgdesc='The psychedelic tunnel-runner'
arch=('i686' 'x86_64')
url='https://github.com/milgra/cortex'
license=('gplv3')
depends=('glew' 'sdl2' 'sdl2_mixer' 'glu')
makedepends=('meson')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/cortex/releases/download/${pkgver}/cortex-${pkgver}.tar.xz"
)

sha256sums=(
	'fa739192a5c0064c2b9762dc69432c398151a835078ee68609b925e71cb47efc'
)

prepare() {
	cd "${pkgname}-${pkgver}"
}

build() {
	mkdir -p build
	arch-meson build "${pkgname}-${pkgver}" --buildtype=release
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
