# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=mmfm
pkgver=0.43b
pkgrel=1
pkgdesc='Viewer and manager for multimedia files'
arch=('i686' 'x86_64')
url='https://github.com/milgra/mmfm'
license=('GPL3')
depends=('wayland' 'freetype2' 'ffmpeg' 'libpng' 'libgl' 'libegl' 'glew' 'openjpeg2' 'libmupdf')
makedepends=('meson' 'ninja' 'pkg-config' 'cmake' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/mmfm/releases/download/${pkgver}/mmfm-${pkgver}.tar.xz"
)

sha256sums=(
	'2577fb218224332c22f2a951ab9ddd274544b1af14c8a746bd8c74940286cecd'
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

