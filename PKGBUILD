# Maintainer: Nev Delap <nevdelap at gmail dot com>
pkgname="ned"
pkgver="1.2.8"
pkgrel=1
pkgdesc="Like grep but with a powerful replace, unlike sed, it's not only line oriented."
arch=("x86_64")
url="https://github.com/nevdelap/ned"
license=("GPL3")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nevdelap/ned/archive/release.$pkgver.tar.gz")
md5sums=('53b3f34e51bdfaefd43344e381afc804')

build() {
	cd "ned-release.$pkgver"
	cargo build --release --locked
}

check() {
	cd "ned-release.$pkgver"
	cargo test --release --locked
}

package() {
	install -Dm755 "ned-release.$pkgver/target/release/ned" "$pkgdir/usr/bin/ned"
    gzip < "ned-release.$pkgver/man/ned.1" > "ned-release.$pkgver/man/ned.1.gz"
    install -Dm 0644 "ned-release.$pkgver/man/ned.1.gz" "$pkgdir/usr/share/man/man1/ned.1.gz"
}
