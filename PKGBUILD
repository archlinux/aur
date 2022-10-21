# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=mmfm
pkgver=0.2
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
	'4755c8b6b1625ff3f7af8e33fa5b1302a27f7b829295c72a9c94876a093e4ec7'
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

