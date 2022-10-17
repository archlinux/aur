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
	'b71767e702c89917e476d722e858582ef511f51e28fa2c568527b0579f3664e8'
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

