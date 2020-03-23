# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.4.0
pkgrel=1
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wayfire>=0.4' gtk3)
makedepends=(wayland-protocols meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4136ceba90c054165b4b0e7a79d78af827d8b8ddb8b54820bda0c17bbaa28eb74981ce94d8c386b91257ca023a34f76f121a003229365afe72d65323f0a1d2cd')

build ()
{
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build
	ninja -C build
}

check () {
	meson test -C build
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
