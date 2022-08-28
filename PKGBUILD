# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov
pkgver=0.73
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
	'e62d8d98a26815b28f8cb28e8b468a075ca6c825b97bc6e77498b4f0f269f856'
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

