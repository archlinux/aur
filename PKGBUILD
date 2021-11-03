
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river
pkgver=0.1.0
pkgrel=2
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'xorg-xwayland' 'polkit'
)
provides=('river' 'riverctl' 'rivertile')
conflicts=('river-bin' 'river-git' 'river-noxwayland-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4153a5511a1008e87a2251fc4510a43d6f6085f41b040222506355ff6d4bd10f')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland \
		--prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
