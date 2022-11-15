# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.7.0
pkgrel=2
arch=(x86_64)
url=https://wayfire.org
license=(custom:MIT)
depends=('wayfire>=0.7' 'wf-shell>=0.7' gtk3)
makedepends=(wayland-protocols meson ninja glm)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=(924a9682dc2f632bad8b6914a8927ad5dcee4b6698f75e89251f1647ad0beaa7)

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
