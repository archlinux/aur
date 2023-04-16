# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.7.5
pkgrel=1
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wayfire>=0.7' 'wf-shell>=0.7' gtk3)
makedepends=(wayland-protocols meson ninja glm)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=(cf0fe0d1c1e1fa2660a28a61cd9d52ac6fa3c9cceab43788b75f4359e1495dd2ddd767cb1f030afec4dadc2b7ef3c260ba83566a70a794dee8d3bb34427754fd)

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
