# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.6.0
pkgrel=1
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wayfire>=0.6' 'wf-shell>=0.6' gtk3)
makedepends=(wayland-protocols meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=(a0ce6541ea1416585d3102a07f8ccc73d53345cdab472a9f1a839af652ccaa3b7c4ef26dbe3c24d3ff4bfb5be9a1c61a7922170dafa9a66082c0de90ebcba3d9)

build ()
{
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build -Dwf_shell=enabled
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
