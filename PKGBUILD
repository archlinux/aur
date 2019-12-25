# Maintainer: Martin Franc <me@martinfranc.eu>

pkgname=wob
pkgver=0.5
pkgrel=2
pkgdesc='A lightweight overlay volume/backlight/progress/anything bar for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/francma/wob'
license=('ISC')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc')
provides=('wob')
conflicts=('wob')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz.sig"
)
validpgpkeys=('5C6DA024DDE27178073EA103F4B432D5D67990E3')
sha512sums=(
	'a6d8515cab4733ebaf8186bcb6988885f0624a3d8323f47aa6646e61260dcca204e8facdc733ba08615767b5691d77858233781ada8f357c48ca40d6bcbed79e'
	'SKIP'
)

prepare() {
	cd "${pkgname}-${pkgver}"
}

build() {
	mkdir -p build
	arch-meson build "${pkgname}-${pkgver}" --buildtype release
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	ninja -C build test
}
