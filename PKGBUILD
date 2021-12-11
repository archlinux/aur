# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.93.3
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/Cogitri/Health
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(meson rust)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_reponame-$pkgver.tar.gz")
sha512sums=('8ddd88b47713c640d43284c0cdd3a43ab2007e99c57119ad5dace07f109b0beff2e87f3da46a826d4d793f59bde5b685ff74f17737d312f020cbc567c2405dbc')

build() {
	arch-meson "$_reponame-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
