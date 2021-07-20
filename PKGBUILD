# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.11.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(MIT custom)
makedepends=(cargo rust)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9da1388b719142780cff8c6dcf5e59d83ad88f23ed81c961361a986081fd2bfa')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$pkgname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
