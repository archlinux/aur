# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=lolcate
pkgver=0.8.0
pkgrel=1
pkgdesc="Lolcate -- A comically fast way of indexing and querying your filesystem. Replaces locate / mlocate / updatedb. Written in Rust."
url="https://github.com/ngirard/lolcate-rs"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ngirard/$pkgname-rs/archive/v$pkgver.tar.gz")
sha512sums=('5d4a904318f2ebc3e7c8eadd94e080bf2814b74f1e4a6cd133a4ddecbdad957c71cbb40791c44e018f711d3df7cfa9f2fb4cd737a15ab15e1dc05111c3c83c6f')

build() {
	cd "$pkgname-rs-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-rs-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
