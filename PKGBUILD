# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-config
pkgver=0.9.0
pkgrel=2
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkg-config wayland-protocols glm doctest cmake)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f681fe028aa9026e0c6894d7b94c544230b8285078f176076a3d964fd1dfc37b')
b2sums=('5f3b529f829f6fc6bdfe974633467707bba501eddca1a9d32f62c1d4ea6398e74ae9bc6f970de821e81fe7fbc4a26b77611587c637ab1961898084571b073ead')

build() {
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dtests=enabled
	ninja -C build
}

check () {
	meson test -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
