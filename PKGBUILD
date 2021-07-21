# Maintainer: Nick Clifford <nick@nickclifford.me>

pkgname=gkeybind
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility for rebinding G-keys on Logitech keyboards"
arch=('x86_64')
url="https://github.com/nickbclifford/gkeybind"
license=('GPL3')
depends=('keyleds' 'libevdev' 'libxkbcommon' 'libevent' 'pcre' 'gc')
makedepends=('crystal' 'shards')
backup=("etc/$pkgname.yml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickbclifford/gkeybind/archive/$pkgver.tar.gz")
sha256sums=('8cdf91b1be2b20b4c2af7f1ee69c8bb9bfcb37e542184e8751d1006af1fc0849')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" CONFIG_PREFIX="$pkgdir" install
	install -Dm644 gkeybind.service "$pkgdir/usr/lib/systemd/system/gkeybind.service"
}
