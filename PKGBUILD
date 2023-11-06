#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
pkgname=revolver
pkgver=0.2.3
pkgrel=1
pkgdesc="A progress spinner for ZSH scripts"
arch=(any)
url=https://github.com/molovo/$pkgname
license=(MIT)
depends=(zsh)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1bcd00126047e0faaacb496e6f01903efb5e5d3a26c72aa6f78061f08c0bf939')

package() {
	cd "$pkgname-$pkgver" || return 1

	install -D $pkgname -t $pkgdir/usr/bin
	install -Dm644 $pkgname.zsh-completion $pkgdir/usr/share/zsh/site-functions/_$pkgname
}
