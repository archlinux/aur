# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=lolcate
pkgver=0.5.0
pkgrel=1
pkgdesc="Lolcate -- A comically fast way of indexing and querying your filesystem. Replaces locate / mlocate / updatedb. Written in Rust."
url="https://github.com/ngirard/lolcate-rs"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ngirard/$pkgname-rs/archive/v$pkgver.tar.gz")
sha512sums=('2efab87cb323648f05adcf25e252d8a72b9bd0f502b815d9dcc4ac5cba678c2609f6f4b18f9a7b4a6bf5f649784a572be665c1d70b85dbbb210798456710e396')

build() {
	cd "$pkgname-rs-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-rs-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
