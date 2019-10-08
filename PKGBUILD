# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Library to create Wayland desktop components using the Layer Shell protocol'
pkgname=gtk-layer-shell
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
url=https://github.com/wmww/gtk-layer-shell
license=(custom:MIT)
depends=(wayland gtk3)
makedepends=(meson ninja gobject-introspection)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('752842ade62b5d0745279049393d71e1fae943ceac4973aef9f43bf0c7a49359')
sha512sums=('3788559405a495d43279b20b9d64e1fb0fb9be4125eb3011a623565938246310c2e81cb6d52db111e42a9cd0739bb273ccf7fcb7c52db8b74a1e44108e061c6d')

build ()
{
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

package ()
{
	DESTDIR="${pkgdir}/" ninja -C build install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/COPYING"
}
