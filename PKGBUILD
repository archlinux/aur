# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=markdown-lsp
pkgdesc='Simple LSP for Markdown files written in Rust'
pkgver=0.1.7
pkgrel=1
url=https://github.com/harehare/mq-edit
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c95365b27429d5b56b6172bc7bc2880aa28e3d9933f7966d3078b2e9c5a5e410')

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
