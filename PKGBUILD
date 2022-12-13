# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.81b
pkgrel=1
pkgdesc='An overview application for sway'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('MIT')
depends=('wayland' 'freetype2')
makedepends=('meson' 'wayland-protocols')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/sov/releases/download/${pkgver}/sov-${pkgver}.tar.xz"
)

sha256sums=(
	'8aa64e0d48e6b2554acacd5313285f00189628f6f4c21e524fadf33bcaadb26a'
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
	install -Dm644 "${pkgname}-${pkgver}/config" "${pkgdir}/usr/share/${pkgname}/config"
}

