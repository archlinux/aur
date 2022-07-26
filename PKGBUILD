# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.4.4
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl' 'liboping')
makedepends=('rustup')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("cc1754c87957f15a3bf3c639a7fbce38fa06fbbf3b9acb56b5c2a2d7d0cd2c2b4f214c5982669be57cf9d3fc265bac573645936438f8a3a6bbd978052bcb6f19")

build() {
	cd "$pkgname-$pkgver"
	rustup override set 1.55.0
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
	# does not work in package. Run after installation if you want to be able to ping.
	#setcap cap_net_raw+ep "$pkgdir/usr/bin/nordselect"
}

