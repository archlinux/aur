# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=mmfm
pkgver=0.42b
pkgrel=1
pkgdesc='Viewer and manager for multimedia files'
arch=('i686' 'x86_64')
url='https://github.com/milgra/mmfm'
license=('GPL3')
depends=('wayland' 'freetype2' 'ffmpeg' 'libpng' 'libgl' 'libegl' 'glew' 'openjpeg2' 'libmupdf')
makedepends=('meson' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/mmfm/releases/download/${pkgver}/mmfm-${pkgver}.tar.xz"
)

sha256sums=(
	'7f8816ba0ae2dfd82664d8b38f97267b43f4c3c277c1cf0d39cca3d815f4854a'
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

