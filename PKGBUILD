# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-config
pkgver=0.10.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkg-config wayland-protocols glm doctest cmake)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9676f08248aaf83b91ecce5c953326c4341084b6efa00d3757a936617a51e487')
b2sums=('e7d80f8f73956a68206a504524463bb357d89376faf044b17731a7584b481acf008814f405a0415965abde12d79ef7ca4cb1788780e979e80d3d9c65a80de229')

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dtests=enabled
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
