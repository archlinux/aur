# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=vmp
pkgver=0.8
pkgrel=1
pkgdesc='Visual music player'
arch=('i686' 'x86_64')
url='https://github.com/milgra/vmp'
license=('gplv3')
depends=('wayland' 'freetype2' 'ffmpeg' 'glew' 'openjpeg2')
makedepends=('meson' 'wayland-protocols' )
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/mmfm/releases/download/${pkgver}/vmp-${pkgver}.tar.xz"
)

sha256sums=(
	'8905f59102a4c4158110e76cb116c9b4ab67bdeb2ed1bd9e0ef807888e80d32a'
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

