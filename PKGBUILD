# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=vmp
pkgver=0.86b
pkgrel=1
pkgdesc='Visual music player'
arch=('i686' 'x86_64')
url='https://github.com/milgra/vmp'
license=('GPL3')
depends=('wayland' 'freetype2' 'ffmpeg' 'libpng' 'libgl' 'libegl' 'glew' 'openjpeg2')
makedepends=('meson' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/vmp/releases/download/${pkgver}/vmp-${pkgver}.tar.xz"
)

sha256sums=(
	'35c7fa7c11973de9c58a9bb2db4b59df23f1f22e97af0fc47445a428800655e1'
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

