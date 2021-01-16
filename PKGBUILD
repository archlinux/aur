# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.4.2
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl' 'liboping')
makedepends=('rustup')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("350a7fc537d3300ab3051c4660584b79f7365e6e60836f6604b787326e58b7f85d46b05740968e4f934acad6fcbf53041a688f41acee41b73a7f330a15fbe915")

build() {
	cd "$pkgname-$pkgver"
	rustup override set 1.49.0
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
	# does not work in package. Run after installation if you want to be able to ping.
	#setcap cap_net_raw+ep "$pkgdir/usr/bin/nordselect"
}

