# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.5.0
pkgrel=1
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wayfire>=0.5' 'wf-shell>=0.5' gtk3)
makedepends=(wayland-protocols meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WayfireWM/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=(c06e97fa3b22f33bb7f05efda380484377596cce83b7874d42b6f3795f275faee2fdd2f2a6a6f24ebbb7e339a0dd3e526a3d02a2e1d4c45b34f76d627896bc53)

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
