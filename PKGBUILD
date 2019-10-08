# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-shell
pkgver=0.3
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
conflicts=("${pkgname}-git")
depends=('wf-config>=0.3' gtkmm3)
makedepends=(wayland wayland-protocols meson ninja git gobject-introspection)
source=("https://github.com/WayfireWM/wf-shell/releases/download/${pkgver}/wf-shell-${pkgver}.tar.xz")
sha512sums=('54b85658af96d7609d90d413f5396057896b2fb369059f89284e69a40c513365c5d21b45452eec21457b61f5fa1c7986532274e8a58fe79cd7182f1f7fdf6f39')

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
