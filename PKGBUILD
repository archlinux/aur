# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire
pkgver=0.1
pkgrel=1
pkgdesc="3D wayland compositor"
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=(cairo wf-config)
makedepends=(meson ninja wayland-protocols)
conflicts=("${pkgname}-git")
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('8c1c74f9e5999060060ee78d2a2d341f291664e7212e186dc0272a4de17d1bf3eca2ae1748a7f162011649390605555416e751ee25a0967e5ce64cd502a41e71')

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}/" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
	install -Dm644 wayfire.ini.default "${pkgdir}/usr/share/doc/${pkgname}/wayfire.ini.default"
	install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
