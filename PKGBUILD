# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=puddinging/rime-cli
_source_type=github-releases
_upstreamver='v0.0.3'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}
pkgver=${_upstreamver##v}
pkgrel=1
# https://search.nixos.org/packages?channel=unstable&query=rime-cli
pkgdesc="A command line tool to add customized vocabulary for Rime IME"
arch=(x86_64)
url=https://github.com/$_repo
license=(Apache)
depends=(librime)
source=("$url/archive/$_upstreamver.tar.gz")
sha256sums=('75b866f251ff098d360b070d9dd93faa20cc5e1ad17f254a47e06197b74a9d30')

build() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	go build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
