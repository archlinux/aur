# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-metronome
_appname=metronome
pkgver=1.3.0
pkgrel=1
pkgdesc="Practice music with a regular tempo"
arch=(x86_64)
url=https://gitlab.gnome.org/World/metronome
license=(GPL3)
depends=(libadwaita gstreamer)
makedepends=(cargo meson appstream-glib)
source=("$url/-/archive/$pkgver/$_appname-$pkgver.tar.gz")
b2sums=('14b0f3b6fc1d3a8a786a1878687f9185bafadbaffc8b1c8dd7d70c5230dd533f3cab9c00fe7bafa914ba5ae289534e24914ed63dd1cfbee0d992dc6d810a0bd7')

build() {
	arch-meson "$_appname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
