# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-metronome
_appname=metronome
pkgver=1.2.0
pkgrel=1
pkgdesc="Practice music with a regular tempo"
arch=(x86_64)
url=https://gitlab.gnome.org/aplazas/metronome
license=(GPL3)
depends=(libadwaita gstreamer)
makedepends=(cargo meson)
source=("$url/-/archive/$pkgver/$_appname-$pkgver.tar.gz")
sha512sums=('b51b03380e5f0f54bed1093b8b5264cb5f6c319308ee56253e3e7255ad94dfaa390adb2a8df192ffeb15b265f04661432a90e0c971800db5804630ed2d6503ac')

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
