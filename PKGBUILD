# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.7.5
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('wayfire>=0.7' cairo glibmm iio-sensor-proxy)
makedepends=(meson ninja glm git wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c3bcfe02617e9c0332e586c433b4bfdf45dd87f8d967d4b0a621a389722efcef')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

check () {
	meson test -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
