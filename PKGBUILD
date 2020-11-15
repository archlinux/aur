# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.4.1
pkgrel=2
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('rustup')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("6b41f39ac4f62b75b123ea6d4516a788983cee856e6fd036c63763c6c0fb53208d1887d3f4f789a733c8fb2792228b5c9c8c3766ad7fb8c5ed2b902fe57d6626")

build() {
	cd "$pkgname-$pkgver"
	rustup override set 1.41.1
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
	# does not work in package. Run after installation if you want to be able to ping.
	#setcap cap_net_raw+ep "$pkgdir/usr/bin/nordselect"
}

