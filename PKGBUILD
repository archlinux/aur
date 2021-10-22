# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.93.1
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/Cogitri/Health
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(meson rust)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_reponame-$pkgver.tar.gz")
sha512sums=('576001da38a9069ffb9a322c821fa58da1972aa2a4afab2a02245b8a3cc9c2f742031b8658fff76dd064aec1eb5e0b0a0545671582f2e2b5ac8df9be330c00e1')

build() {
	arch-meson "$_reponame-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
