# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.8.0
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('wayfire>=0.7' cairo glibmm iio-sensor-proxy)
makedepends=(meson ninja glm git wayland-protocols)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=('f8f46782e31f170eb566567f50d302df4db23fbeb29c71569624a7f79c2bbcfcf48b070e7b55bf1880a9cd02afe78783d6680c457e466d765eb0db72f4b1f61b')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled
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
