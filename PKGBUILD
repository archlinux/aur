# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.1
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=(wf-config gtkmm3)
makedepends=(wayland wayland-protocols meson ninja git)
source=("https://github.com/WayfireWM/wf-shell/releases/download/${pkgver}/wf-shell-${pkgver}.tar.xz")
sha512sums=('3cc147740cb7c921dd3b6755548b362d7a1d8847a364405bea4beef2db3b5c2d73648f46813b3fc7392816524d4c9e369eb59bd2f215ed48f3828dfcfb92e95c')

build () {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
