# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.83b
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
    'b9e7e6d43f670f7306d0d235575d257f6eea4c359b00f866d4a36a91bf0e660e'
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

