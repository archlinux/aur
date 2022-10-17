# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=vmp
pkgver=0.81
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
	'eb569dcdd07d80e8e976e31c9568aa665c520d76414e557fc0bdb4484293e941'
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

