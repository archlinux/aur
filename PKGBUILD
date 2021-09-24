# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-metronome
_appname=metronome
pkgver=1.1.0
pkgrel=1
pkgdesc="Practice music with a regular tempo"
arch=(x86_64)
url=https://gitlab.gnome.org/aplazas/metronome
license=(GPL3)
depends=(libadwaita gstreamer)
makedepends=(cargo meson)
source=("$url/-/archive/$pkgver/$_appname-$pkgver.tar.gz")
sha512sums=('213073080810f11a7d9ab46b385a7a59037ce65bd75160127eb7e823c84a034258f8da197b8002aaaf66121827578ccacd59f32c1cedba8d6fa2c2e830ef901f')

build() {
	arch-meson "$_appname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
