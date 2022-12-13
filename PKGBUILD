# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=wcp
pkgver=0.72b
pkgrel=1
pkgdesc='Script-driven control panel/system menu for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/milgra/wcp'
license=('MIT')
depends=('wayland' 'freetype2' 'libpng')
makedepends=('meson' 'wayland-protocols')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/wcp/releases/download/${pkgver}/wcp-${pkgver}.tar.xz"
)

sha256sums=(
	'd3e923c61a2c33b7fa1fd8b0d96dfc0880d1a44a42c35092fe8f8a88a991a3ef'
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

