# Maintainer: Martin Franc <me@martinfranc.eu>

pkgname=wob
pkgver=0.4
pkgrel=1
pkgdesc='A lightweight overlay volume/backlight/progress/anything bar for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/francma/wob'
license=('ISC')
makedepends=('meson' 'git' 'wayland-protocols')
provides=('wob')
conflicts=('wob')
source=("git+${url}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
	cd ${pkgname}
	git submodule update --init --recursive
	mkdir -p build-${pkgname}-${pkgver}
	arch-meson build-${pkgname}-${pkgver} --buildtype release
}

build() {
	cd ${pkgname}
	ninja -C build-${pkgname}-${pkgver}
}

package() {
	cd ${pkgname}
	DESTDIR="$pkgdir" ninja -C build-${pkgname}-${pkgver} install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
