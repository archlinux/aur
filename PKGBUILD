
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river
pkgver=0.2.3
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'xorg-xwayland'
)
optdepends=(
	'polkit: access seat through systemd-logind'
)
makedepends=('zig>=0.10' 'zig<0.11' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river-bin' 'river-git' 'river-noxwayland-git')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7acdd2b929e16a20006b4baf1f29e7a8dc7f70cf5747e1503a610a90d1637132')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

	install -d "$pkgdir/usr/share/$pkgname"
	cp -fR example "$pkgdir/usr/share/$pkgname"
}
