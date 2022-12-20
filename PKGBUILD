# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=wcp
pkgver=0.74b
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
	'5d1eb736acc607be1f7efce83f1159f96208f47a2d86497379d30159f37f1a70'
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

