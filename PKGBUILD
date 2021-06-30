# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=svls
pkgver=0.1.28
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
sha256sums=('44cb324d8a38542941e67e8bf279cad9d1c594ed2a88525d860e6605e0b7caba')

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
