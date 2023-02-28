# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=svls
pkgver=0.2.6
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
sha256sums=('c4d7c8f26687ff42aa86e55f902ada8a94114d75771847f79bea76e80637ea86')

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
