# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.0.1
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("1988746407a9c224390f36385668b0bc02bc58b5c3ce467a32c61a2d82dbcf662489195b9f9e8be477cb39070f91d71238b834050607b33b58085c291163c06e")
validpgpkeys=("CC0B7CE9604A8A91F0D70B778489DB248465FDD7")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
}

post_install() {
	# Allow ping functionality
	# This crate uses liboping, a non-standard way to ping. This is prohibited by Linux by default.
	setcap cap_net_raw+ep /usr/bin/nordselect
}
