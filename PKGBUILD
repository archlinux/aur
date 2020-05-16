# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=lolcate
pkgver=0.6.0
pkgrel=1
pkgdesc="Lolcate -- A comically fast way of indexing and querying your filesystem. Replaces locate / mlocate / updatedb. Written in Rust."
url="https://github.com/ngirard/lolcate-rs"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ngirard/$pkgname-rs/archive/v$pkgver.tar.gz")
sha512sums=('170310453a527348e72637e6f15016eaa4eabdd210d026876f935a5e5cb73d19e618144a8e470f0a79d91ef800e9575a353f5efb7cf3e153bedcf403e8d684eb')

build() {
	cd "$pkgname-rs-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-rs-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
