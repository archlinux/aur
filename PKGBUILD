# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=wcp
pkgver=0.5
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
	'1c6696ff79c6380ab57a8bdb8e3698df99208559d71622a5cbfa7fcb0ee8e328'
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

