# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=vmp
pkgver=0.83
pkgrel=1
pkgdesc='Visual music player'
arch=('i686' 'x86_64')
url='https://github.com/milgra/vmp'
license=('gplv3')
depends=('wayland' 'freetype2' 'ffmpeg' 'glew' 'openjpeg2')
makedepends=('meson' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/vmp/releases/download/${pkgver}/vmp-${pkgver}.tar.xz"
)

sha256sums=(
	'3990e1f87b995839104a6618321495e6a0ad299c4e571685112a39e5f30c775e'
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

