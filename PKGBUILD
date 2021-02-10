# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=portfolio-file-manager
pkgver=0.9.9
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34a6d50040d13fc7fe34770a72c004630483f65baee82efa64867e0aa32765d8')

build() {
	arch-meson Portfolio-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/dev.tchx84.Portfolio "$pkgdir/usr/bin/portfolio"
}
