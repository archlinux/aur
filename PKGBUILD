#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=litespeedtest
pkgver=0.15.0
pkgrel=1
pkgdesc="A simple tool for batch test ss/ssr/v2ray/trojan servers."
arch=(i386 x86_64)
url=https://github.com/xxf098/LiteSpeedTest
license=(GPL)
_arch="$(uname -m | sed s/x86_64/amd64/)"
_os="${OSTYPE%%-*}"
[[ $_os == windows ]] && _ext=zip || _ext=gz
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/lite-${_os}-${_arch}-v${pkgver}.$_ext")
sha256sums=('963333af61b54cf7e33788225ceef7fd3b8562868212347ac5811af8774f2df6')

package() {
	install -D "$pkgname-$pkgver" -T "$pkgdir/usr/bin/lite"
}
