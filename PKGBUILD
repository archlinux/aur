# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.3.1
pkgrel=1
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wf-config>=0.3' gtk3)
makedepends=(wayland-protocols meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('890dda758b79ebf376db7dda63a5a1838206bb62bf03b23970ff5ef2e3bf1dce7cc83c37cc4dc41307bade5cb3fae803a96c68f82fed5b25d855c19cfc0b4dd2')

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
