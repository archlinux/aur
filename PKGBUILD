# Maintainer: Nick Clifford <nick@nickclifford.me>

pkgname=gkeybind
pkgver=0.1.2
pkgrel=1
pkgdesc="Utility for rebinding G-keys on Logitech keyboards"
arch=('x86_64')
url="https://github.com/nickbclifford/gkeybind"
license=('GPL3')
depends=('keyleds' 'libevdev' 'libxkbcommon' 'libevent' 'pcre' 'gc')
makedepends=('crystal' 'shards')
backup=("etc/$pkgname.yml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickbclifford/gkeybind/archive/$pkgver.tar.gz")
md5sums=('1e204771bc2cf89e7fd476eb0a04a7da')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" CONFIG_PREFIX="$pkgdir" install
	install -Dm644 gkeybind.service "$pkgdir/usr/lib/systemd/system/gkeybind.service"
}
