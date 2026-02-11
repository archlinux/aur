# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

pkgname=purl
pkgver=0.1.0
pkgrel=1
pkgdesc="A curl-esque CLI for making HTTP requests that require payment. Designed for humans and agents alike."
arch=('any')
url="https://github.com/stripe/purl"
license=('MIT')
options=(!lto)
makedepends=('rust')
checkdepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo clippy -- -D warnings
	cargo test
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}