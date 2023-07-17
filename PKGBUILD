#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=rime-cli
pkgver=0.0.3
pkgrel=1
pkgdesc="A command line tool to add customized vocabulary for Rime IME"
arch=(x86_64)
url=https://github.com/puddinging/rime-cli
license=(Apache)
depends=(librime)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('75b866f251ff098d360b070d9dd93faa20cc5e1ad17f254a47e06197b74a9d30')

build() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver" || return 1
	install -D "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
