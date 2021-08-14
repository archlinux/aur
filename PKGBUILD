# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-metronome
_appname=metronome
pkgver=1.0.0
pkgrel=1
pkgdesc="Practice music with a regular tempo"
arch=(x86_64)
url=https://gitlab.gnome.org/aplazas/metronome
license=('GPL')
depends=(libadwaita)
makedepends=(cargo meson)
source=("$url/-/archive/$pkgver/$_appname-$pkgver.tar.gz")
sha512sums=('5a63b6bfe9ab30ef909e10c5e2beb7f079f876d9bda33e2dd52477960e1f0e1ca242b16c4bf889fff5f010cec65c373592390cfd485909de1dc1be2853d1584b')

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
