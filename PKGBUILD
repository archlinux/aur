# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=mmfm
pkgver=0.1
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
	'36329422be453b5aa97f1eec9eb2448d3f456e309378b4ede42f95418b88cc61'
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
	cp -R "${pkgname}-${pkgver}/res" "${pkgdir}/usr/share/${pkgname}/"
}

