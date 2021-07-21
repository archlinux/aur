# Maintainer: debendraoli <olidebendra at gmail dot com>
pkgname=cage-wayland-git
pkgver=0.1.4
pkgrel=1
epoch=1
license=("MIT")
pkgdesc="A Wayland kiosk"
makedepends=("meson" "wayland-protocols")
depends=("wlroots" "wayland" "libxkbcommon")
arch=("x86_64")
url="https://www.hjdskes.nl/projects/cage/"
source=("https://github.com/Hjdskes/cage/releases/download/v$pkgver/cage-$pkgver.tar.gz")
sha1sums=("SKIP")
provides=("cage")
conflicts=("cage")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/cage-${pkgver}"
    basename "${srcdir}/cage-${pkgver}" | cut -f 2 -d"-"
}

prepare() {
	cd "${srcdir}/cage-${pkgver}"
	meson --buildtype=release -Dxwayland=false --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/cage-${pkgver}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/cage-${pkgver}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
