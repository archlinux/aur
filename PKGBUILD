# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=brawl
pkgver=0.8
pkgrel=1
pkgdesc='2D mass brawl simulator'
arch=('i686' 'x86_64')
url='https://github.com/milgra/brawl'
license=('gplv3')
depends=('glew' 'sdl2' 'sdl2_mixer' 'glu' 'freetype2')
makedepends=('meson')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/brawl/releases/download/${pkgver}/brawl-${pkgver}.tar.xz"
)

sha256sums=(
	'5e8a2110fe9c1e6cf41b344f9f8a23bda2fce5139e2bcb4923b43f60033b6895'
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
