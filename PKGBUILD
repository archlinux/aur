# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=luatex
pkgname=luahbtex
pkgver=1.23.3
pkgrel=1
pkgdesc="The LuaTeX project's main objective is to provide an open and configurable variant of TeX while at the same time offering downward compatibility"
arch=(i686 x86_64 arm aarch64)
url=https://www.luatex.org/
license=(GPL2)
source=("https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/archive/$pkgver/luatex-$pkgver.zip"
	fix-LUA_ROOT.patch)
sha256sums=('9b9b0a7ddda3b92516b946a0618a4ff28748e14c94bc94d46f3faf00047024be'
            '1874de144770f9c9bed4b6d0848121607070a9590110a40b89714d374b109c3c')

prepare() {
	cd "$_pkgname-$pkgver" || return 1

	patch -Np1 -i ../fix-LUA_ROOT.patch
}

build() {
	cd "$_pkgname-$pkgver" || return 1

	CFLAGS=-std=gnu99 ./build.sh --nolua53 --luahb --parallel
}

package() {
	cd "$_pkgname-$pkgver" || return 1

	install -D build/texk/web2c/luahbtex -t "$pkgdir/usr/bin"
	install -Dm644 source/texk/kpathsea/texmf.cnf -t "$pkgdir/etc/texmf/web2c"
}
# ex: nowrap
