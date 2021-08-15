# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.92.6
pkgrel=2
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/Cogitri/Health
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(meson rust)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_reponame-$pkgver.tar.gz")
sha512sums=('1aab783b9880c03e8779c5207317ae3fddf6446ed691eec4a318c9ffc7ed1d6cc281f49b92aa6dd9dbc36f42845a8d7068ce6a16a2a37ab576d516b60bb33e9f')

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
