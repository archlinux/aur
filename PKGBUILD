# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=netctl2iwd
pkgver=0.1.2
pkgrel=2
pkgdesc="Convert your netctl wireless profiles to iwd profiles."
arch=(x86_64)
url="https://github.com/bertptrs/netctl2iwd"
license=('MIT')
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bertptrs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('479e7e0d8776def17eddd1b5873400589d99a8330f08ed058190009cf8619339')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	cargo install --path . --root "$pkgdir/usr"
	rm "$pkgdir/usr/.crates.toml" "$pkgdir/usr/.crates2.json"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m 644 LICENSE
}
