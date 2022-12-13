# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.82b
pkgrel=1
pkgdesc='An overview application for sway'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('MIT')
depends=('wayland' 'freetype2')
makedepends=('meson' 'wayland-protocols')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/sov/releases/download/${pkgver}/sov-${pkgver}.tar.xz"
)

sha256sums=(
    'e9720828288d5d363b8f727bf387eea6b0f3a67ee498598d8e218d1ae12da11c'
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

