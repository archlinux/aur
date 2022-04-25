# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.61
pkgrel=1
pkgdesc='An overview application for sway'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'freetype2')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/milgra/sov/releases/download/${pkgver}/sov-${pkgver}.tar.xz"
)

sha256sums=(
	'baa9a13c7b64a8f811fc89768142d037f5b425baf850536cab1615858fe5fea1'
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

