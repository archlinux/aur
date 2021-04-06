# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.2.0
pkgrel=1
pkgdesc="reset file timestamps to repo state "
arch=('any')
url="https://github.com/alerque/git-warp-time"
license=("GPL3")
makedepends=("rust")
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8cd0c5be1e9382bb5f47312234cf188e1220088f2a4abd4ca6f47c898a33bb0')

prepare() {
	cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

