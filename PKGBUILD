# Maintainer: Flat <Flat@imo.uto.moe>
pkgname=parallel-rust
pkgver=0.10.3
pkgrel=1
pkgdesc="Inspired by GNU Parallel, a command-line CPU load balancer written in Rust."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/parallel"
license=('MIT')
makedepends=('rustup' 'musl')
optdepends=('dash: increased performance over sh')
provides=('parallel')
conflicts=('parallel')
source=("https://github.com/mmstick/parallel/archive/$pkgver.tar.gz")
md5sums=('86e2fc0d64b22c9a57bd7dc728b39c1b')

prepare() {
  CARGO_HOME=$srcdir/rust RUSTUP_HOME=$srcdir/rust rustup default nightly
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
