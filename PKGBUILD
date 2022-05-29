
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-levee
_pkgname=levee
pkgver=0.1.1
pkgrel=1
pkgdesc='Statusbar for the river wayland compositor.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/levee'
license=('MIT')
depends=('wayland' 'wayland-protocols' 'fcft' 'pixman' 'libpulse')
makedepends=('zig' 'git')
provides=('levee')
conflicts=('river-levee-git')
source=("https://git.sr.ht/~andreafeletto/$_pkgname/refs/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('58147b9580e13c56d94b864ac6c6cd3d7c1f27ae8003fcf47460591c7dc16933')

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
