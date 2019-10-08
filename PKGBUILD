# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.3
pkgrel=2
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wf-config>=0.3' libxml2 gtkmm3)
makedepends=(wayland-protocols meson ninja)
source=("https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e997d1b0f707cca2d170bc82667fdacd8489eff629931e3af1c03ac2be5461f07c81b54930561b0baaf10f5e632f0939247344ffeedf3c3eef8f03cb74b2fd0d')

build ()
{
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
