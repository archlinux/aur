# Maintainer: debendraoli <olidebendra at gmail dot com>
pkgname=cage-no-xwayland
pkgver=0.1.4
pkgrel=2
license=("MIT")
pkgdesc="A Wayland kiosk"
makedepends=("meson" "wayland-protocols")
depends=("wlroots" "wayland" "libxkbcommon")
optdepends=('libfontenc: font rendering support')
arch=("x86_64")
url="cage-$version:https://www.hjdskes.nl/projects/cage/"
source=("https://github.com/Hjdskes/cage/releases/download/v$pkgver/cage-$pkgver.tar.gz")
sha256sums=("dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90")
provides=("cage")
conflicts=("cage")
options=(debug !strip)

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
