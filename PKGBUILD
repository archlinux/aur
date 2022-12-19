# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=vmp
pkgver=0.87b
pkgrel=1
pkgdesc='Visual music player'
arch=('i686' 'x86_64')
url='https://github.com/milgra/vmp'
license=('GPL3')
depends=('wayland' 'freetype2' 'ffmpeg' 'libpng' 'libgl' 'libegl' 'glew' 'openjpeg2')
makedepends=('meson' 'ninja' 'pkg-config' 'cmake' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/vmp/releases/download/${pkgver}/vmp-${pkgver}.tar.xz"
)

sha256sums=(
	'5504b5b93a085f3a88bdeaa9cadc4667437a65a8bc6a28aac49f5a7cb703768a'
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

