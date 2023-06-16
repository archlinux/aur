# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=berberman/nvfetcher
_source_type=github-releases
_upstreamver=0.6.1
_pkgname=${_repo##*/}

pkgname=$(tr A-Z a-z <<<${_pkgname//_/-})
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="a tool to automate nix package updates"
arch=(x86_64)
url=https://github.com/berberman/nvfetcher
license=(MIT)
makedepends=(ghc)
depends=(nix-prefetch-git)
source=("https://github.com/berberman/nvfetcher/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('072b504fbb1a99c0291a5a584a141da286eb6463128313623d54d991444578dd')

build() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	cabal configure --disable-library-vanilla --enable-shared --enable-executable-dynamic --ghc-options=-dynamic
	cabal build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1

	install -D dist-newstyle/build/x86_64-linux/ghc-*/nvfetcher-"$pkgver.0"/x/nvfetcher/build/nvfetcher/nvfetcher -t "$pkgdir/usr/bin"
}
