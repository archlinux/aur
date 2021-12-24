
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river
pkgver=0.1.2
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots>=0.15.0' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'xorg-xwayland' 'polkit'
)
makedepends=('zig=0.9.0' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river-bin' 'river-git' 'river-noxwayland-git')
source=(
	"$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
	'river.desktop'
)
sha256sums=(
	'02f426b8c90905a9423333daf35d7d713e8d09617c16cb22878b60301f28f4b4'
	'6ccc55e95666904cbdeeeeed841a16f728cbae2609646130a4c53785e588e4b0'
)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland \
		--prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

	cd "$srcdir"
	install -Dm644 river.desktop -t "$pkgdir/usr/share/wayland-sessions"
}
