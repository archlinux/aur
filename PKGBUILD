# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=mmfm
pkgver=0.4b
pkgrel=1
pkgdesc='Viewer and manager for multimedia files'
arch=('i686' 'x86_64')
url='https://github.com/milgra/mmfm'
license=('gplv3')
depends=('wayland' 'freetype2' 'ffmpeg' 'glew' 'openjpeg2' 'libmupdf')
makedepends=('meson' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/mmfm/releases/download/${pkgver}/mmfm-${pkgver}.tar.xz"
)

sha256sums=(
	'76bcb78bed1dde2cdd19a37ce6c95b2a2e678e0300bdd85522f9d3642f2e14b4'
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

