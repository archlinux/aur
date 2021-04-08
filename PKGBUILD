# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.3.0
pkgrel=1
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
makedepends=(rust)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f0c2b1d5ddfb73a98688afbe9151ac940021f1b437452dc3a5313c924a1a61e7')

prepare() {
	cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
