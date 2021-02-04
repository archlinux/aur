# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=portfolio-file-manager
pkgver=0.9.8
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('66b13ef14e262693b22ca5a4520c09918a183a924beb455faee83d2c9c3edba4')

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
