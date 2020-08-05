# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-extra
pkgver=0.5.0
pkgrel=1
pkgdesc='Additional plugins for Wayfire'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('wayfire>=0.5' cairo glibmm)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=(64c56ffa66df26a7cbee1af41c34ae123abe8252deeaf02687237688a8281a9e)

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
