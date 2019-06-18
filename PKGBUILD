# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.2.0
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("de4801a6f35eb03c5a53182cb7974f57f5f5bdd1b97477de1d9789b68464f34410c834d4c84213e0a239c9221fafe45418b7d7b2d96769a6335ebdc916147a48")
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
