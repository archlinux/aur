# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=wcp
pkgver=0.73b
pkgrel=1
pkgdesc='Script-driven control panel/system menu for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/milgra/wcp'
license=('GPL3')
depends=('wayland' 'freetype2' 'libpng' 'libgl' 'libegl' 'glew' )
makedepends=('meson' 'ninja' 'pkg-config' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/wcp/releases/download/${pkgver}/wcp-${pkgver}.tar.xz"
)

sha256sums=(
	'761c4eb7320070d4f6f851a73cd67baf85ed4e51a5a22481f54dd62560f95fe1'
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

