# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=git-ignore
pkgver=1.1.2
pkgrel=1
pkgdesc="Quickly and easily list and fetch .gitignore templates from gitignore.io"
arch=('x86_64')
url="https://github.com/sondr3/git-ignore"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
validpgpkeys=('0EC3FA89EFBAB421F82E40B025676BCBFFAD76B1')
sha256sums=('4cc4476b77418dae96f43a7ae80cf58dd5e740bc83d3f6004c6c035df7ad61e3')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --all-features --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 "target/assets/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
