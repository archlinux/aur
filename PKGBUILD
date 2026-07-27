# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='fennel-ls-luajit-git'
pkgrel=1
pkgdesc='Language Server for Fennel'
pkgver=0.2.4.r8.g0c21b00
arch=('any')
url='https://git.sr.ht/~xerool/fennel-ls'
license=('MIT')
depends=('luajit')
makedepends=('git' 'pandoc')
provides=('fennel-ls')
conflicts=('fennel-ls' 'fennel-ls-git')
source=("$pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	make LUA=luajit
}

package() {
	cd "$pkgname"
	make install PREFIX=/usr DESTDIR="$pkgdir" LUA=luajit
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
