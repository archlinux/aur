# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.3.1
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("46fd4ebbb17678e7762d4f2d9962dd3386d6b3d6bbc9968b44765f30bfd845fcf981bc8b7b2d82a75e38a49726ab42466244c49fd4f0c59549630ec6e1caa072")
validpgpkeys=("CC0B7CE9604A8A91F0D70B778489DB248465FDD7")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
	# does not work in package. Run after installation if you want to be able to ping.
	#setcap cap_net_raw+ep "$pkgdir/usr/bin/nordselect"
}

