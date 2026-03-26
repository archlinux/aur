# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=markdown-lsp
pkgdesc='Simple LSP for Markdown files written in Rust'
pkgver=0.1.4
pkgrel=1
url=https://github.com/harehare/mq-edit
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('425aefa349f96d455c108aa0369ed7949882c73dcb82e06db9fb35e00598ff2b')

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
