#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=svlint
pkgver=0.8.0
pkgrel=1
pkgdesc="SystemVerilog linter compliant with IEEE1800-2017"
arch=('x86_64')
url="https://github.com/dalance/svlint"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('50a5d225351ef4971d766f2c1bb80af3ae36990c6b02ae3adb4c52a26f33d82d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release --all-features --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
