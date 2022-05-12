
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-levee
_pkgname=levee
pkgver=0.1.0
pkgrel=3
pkgdesc='Statusbar for the river wayland compositor.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/levee'
license=('MIT')
depends=('wayland' 'wayland-protocols' 'fcft' 'pixman' 'libpulse')
makedepends=('zig' 'git')
provides=('levee')
conflicts=('river-levee-git')
source=("https://git.sr.ht/~andreafeletto/$_pkgname/refs/download/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('271caefe6673fdb8334c7d171f9ef17a458ae152fdcc24f96a84ceb6e49f64e2')

build() {
	cd "$srcdir/$_pkgname-v$pkgver"
	zig build -Drelease-safe
}

package() {
	cd "$srcdir/$_pkgname-v$pkgver"
	DESTDIR="$pkgdir" zig build -Drelease-safe --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
