# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=swop
pkgver=1.1
pkgrel=1
pkgdesc='i3 open but for Wayland'
url='https://git.sr.ht/~brocellous/swop'
arch=('x86_64')
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~brocellous/$pkgname/archive/v$pkgver.tar.gz"
	"40-swop.conf"
)
depends=('wayland')
makedepdends=('wayland-protocols')
sha256sums=('f6ed989b290ac52e567cc4d35f521717567330b9f6dca46281986de96e698395'
            'SKIP')

build() {
	cd "$pkgname-v$pkgver"
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -Dm644 "$srcdir/40-swop.conf" "$pkgdir/etc/sway/config.d/40-swop.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
