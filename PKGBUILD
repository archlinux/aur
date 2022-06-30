# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=svls
pkgver=0.2.3
pkgrel=1
epoch=
pkgdesc="SystemVerilog language server"
arch=('x86_64')
url="https://github.com/dalance/svls"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('21fe5a736e7ac98a2822a0138875bbe8193a1e9f4378922356e38d450fb66267')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# https://github.com/rust-lang/rust/issues/81654
	cargo update --package lexical-core
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
