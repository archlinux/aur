# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=markdown-lsp
pkgdesc='Simple LSP for Markdown files written in Rust'
pkgver=0.1.6
pkgrel=1
url=https://github.com/harehare/mq-edit
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61fcf0b5aa0e03d4cc6cd97983ce3db5165ded411cd29a1c31a2abf31e53e4f1')

prepare () {
	cd "mq-edit-$pkgver/crates/$pkgname"
	cargo fetch --target host-tuple
}

build () {
	cd "mq-edit-$pkgver/crates/$pkgname"
	cargo build --frozen --release --all-features --target-dir target
}

check () {
	cd "mq-edit-$pkgver/crates/$pkgname"
	cargo test --frozen --release --all-features
}

package () {
	cd "mq-edit-$pkgver/crates/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
