# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.85b
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
        '7de39cc82953c5b99169439e9b1f8151a9a637550d183a6ba91f153c3bf1b02b'
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
