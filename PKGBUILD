# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.84b
pkgrel=1
pkgdesc='An overview application for sway'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('MIT')
depends=('wayland' 'freetype2' 'libpng' 'libgl' 'libegl' 'glew' )
makedepends=('meson' 'wayland-protocols')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/sov/releases/download/${pkgver}/sov-${pkgver}.tar.xz"
)

sha256sums=(
    '372fdb0fefa2d9276bd4ffa83a6e35795ce9e8d04b752f13edbde9a882b9a191'
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
