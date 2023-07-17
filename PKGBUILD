#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=md2vim
pkgver=21.12.14.0
pkgrel=1
pkgdesc='Tool for automatically converting markdown to vimdoc format'
arch=(i386 x86_64 arm aarch64)
url=https://github.com/FooSoft/md2vim
license=(MIT)
_arch="$(uname -m | sed s/x86_64/amd64/)"
_os="${OSTYPE%%-*}"
[[ $_os == windows ]] && _ext=zip || _ext=tar.gz
source=("$_pkgname-$pkgver::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
sha256sums=('65656e9e5b269dd2d5088896178a131f990d83d6e169fd8adb13076a943df75c')

package() {
	cd "$srcdir"
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
}
