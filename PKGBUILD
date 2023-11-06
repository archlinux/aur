#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
pkgname=zunit
pkgver=0.8.2
pkgrel=1
pkgdesc="a powerful unit testing framework for zsh"
arch=(any)
url=https://github.com/zunit-zsh/$pkgname
license=(MIT)
depends=(revolver)
makedepends=(zsh)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('eb94dad722dc7e95395f6e4b6a3e2eea5f7fd487d807112582a73ed7c3b2e4a7')

build() {
	cd "$pkgname-$pkgver" || return 1

	./build.zsh
}

package() {
	cd "$pkgname-$pkgver" || return 1

	install -D $pkgname -t $pkgdir/usr/bin
	install -Dm644 $pkgname.zsh-completion $pkgdir/usr/share/zsh/site-functions/_$pkgname
}
