# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.0.0
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("1bba9ed4d52069d497402e886d44f04984e158bfe6d16e4536ce77417aba8d0f9af46cc95d5f951fd4c6e833e6de55da4a358c83c2cf382cff9e7054c4d4686e")
validpgpkeys=("CC0B7CE9604A8A91F0D70B778489DB248465FDD7")

build() {
	cd "$pkgname-$pkgver"
	BIN_LOCATION='/usr/bin/nordselect' cargo build --release
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
