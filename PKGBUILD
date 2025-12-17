# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
pkgname=ts_query_ls
pkgver=3.14.0
pkgrel=1
pkgdesc="LSP implementation for Tree-sitter's query files"
arch=(x86_64)
url=https://github.com/ribru17/ts_query_ls
license=(MIT)
makedepends=(cargo)
conflicts=("$pkgname")
provides=("$pkgname")
options=('!lto')
source=("https://github.com/ribru17/ts_query_ls/archive/v$pkgver.tar.gz")
sha256sums=('cfe3bd81bd9fcd153e3813e8b6b7084eab40fc967d1eae4a4418637e37635b9d')

build() {
	cd "$pkgname-$pkgver" || return 1

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver" || return 1

	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
