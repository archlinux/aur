# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=1.4.3
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl' 'liboping')
makedepends=('rustup')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("dd2908eb8a9713a519256b96d668d15cd94bbeb88eebdbecf3775c64271c750de86081f8d2266f794ee5e1a4d5198254f221ebba2127c73826a313e6063f2f8f")

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

