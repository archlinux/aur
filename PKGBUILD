# Maintainer: Flat <Flat@imo.uto.moe>
pkgname=parallel-rust
pkgver=0.11.3
pkgrel=3
pkgdesc="Inspired by GNU Parallel, a command-line CPU load balancer written in Rust."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/parallel"
license=('MIT')
makedepends=('rustup' 'musl')
optdepends=('dash: increased performance over sh')
conflicts=('parallel')
source=("https://github.com/mmstick/parallel/archive/$pkgver.tar.gz")
md5sums=('03645f9059b24493716f7e9ff64241e9')

prepare() {
  CARGO_HOME=$srcdir/rust RUSTUP_HOME=$srcdir/rust rustup override set nightly
  CARGO_HOME=$srcdir/rust RUSTUP_HOME=$srcdir/rust rustup target add $CARCH-unknown-linux-musl
}

build() {
	cd "parallel-$pkgver"
	CARGO_HOME=$srcdir/rust RUSTUP_HOME=$srcdir/rust cargo build --release --target $CARCH-unknown-linux-musl
}

package() {
	cd "parallel-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install target/$CARCH-unknown-linux-musl/release/parallel $pkgdir/usr/bin
	install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
