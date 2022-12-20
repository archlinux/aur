# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.87b
pkgrel=1
pkgdesc='An overview application for sway'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('GPL3')
depends=('wayland' 'freetype2' 'libpng' 'libgl' 'libegl' 'glew' )
makedepends=('meson' 'ninja' 'pkg-config' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/sov/releases/download/${pkgver}/sov-${pkgver}.tar.xz"
)

sha256sums=(
        '29a960c63b2c55c6863b2f12c54f6b878930eea2ed7e8045335554bc418f3314'
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
