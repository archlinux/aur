
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-levee
_pkgname=levee
pkgver=0.1.2
pkgrel=1
pkgdesc='Statusbar for the river wayland compositor.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/levee'
license=('MIT')
depends=('wayland' 'fcft' 'pixman' 'libpulse')
makedepends=('zig' 'git' 'wayland-protocols')
provides=('levee')
conflicts=('river-levee-git')
source=("https://git.sr.ht/~andreafeletto/$_pkgname/refs/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('7370451c1532edef147127ee152fd82a129fbe3df885490410971ab67c42d08e')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	zig build -Drelease-safe
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	DESTDIR="$pkgdir" zig build -Drelease-safe --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
