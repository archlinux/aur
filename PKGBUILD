# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=lolcate
pkgver=0.10.0
pkgrel=1
pkgdesc="Lolcate -- A comically fast way of indexing and querying your filesystem. Replaces locate / mlocate / updatedb. Written in Rust."
url="https://github.com/ngirard/lolcate-rs"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ngirard/$pkgname-rs/archive/v$pkgver.tar.gz")
sha512sums=('7b08dcdd9f8ddd624f947bbe76d9beed82bea2f0837e568e9c71c4a7113e32962e3195c90a72957697992467365be916d70c5f2ebe637e7f282b0d97a4b9113c')

build() {
	cd "$pkgname-rs-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-rs-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
