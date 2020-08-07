# Maintainer: Martin Franc <me@martinfranc.eu>

pkgname=wob
pkgver=0.9
pkgrel=1
pkgdesc='A lightweight overlay volume/backlight/progress/anything bar for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/francma/wob'
license=('ISC')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz.sig"
)
validpgpkeys=('5C6DA024DDE27178073EA103F4B432D5D67990E3')
sha512sums=(
	'6dca402fb698866231da044e040c6d24ec2957d4b807d6b1a8e29a8ae3dd8f9761617cc1b26594b4eddf8bbfb84b44a72ce7b2eb5ce0ecebe3e9e39676ff87ca'
	'SKIP'
)

prepare() {
	cd "${pkgname}-${pkgver}"
}

build() {
	mkdir -p build
	arch-meson build "${pkgname}-${pkgver}" -D b_ndebug=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	ninja -C build test
}
