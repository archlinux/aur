# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-config
pkgver=0.8.0
pkgrel=4
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkg-config wayland-protocols glm doctest cmake)
conflicts=("${pkgname}-git")
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=('d56cd04c18c2cd8c0bac86493ad662244bde0e9cce1caf81d0fff34d9f2df2470c1aa8c95fead9e91dd5793d570b01dc6ef99b1986b8658b06ef93156a1526f8')

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled
	ninja -C build
}

check () {
	meson test -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
