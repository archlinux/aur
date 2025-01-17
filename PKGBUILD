# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=pllua
pkgver=2.0.12
pkgrel=1
replaces=('pllua-ng')
pkgdesc='PL/Lua is a procedural language module for the PostgreSQL database that allows server-side functions to be written in Lua'
arch=('x86_64')
url='https://pllua.github.io/pllua/'
license=('MIT')
depends=('lua' 'postgresql')
makedepends=('clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RhodiumToad/pllua-ng/archive/REL_${pkgver//./_}.tar.gz")
sha256sums=('7d7ce7cb6443644f5448a5c943a52b33a264ba80f737701c43cdec1dc67b2965')

build() {
	cd "pllua-ng-REL_${pkgver//./_}"

	make LUA=lua LUAC=luac LUA_INCDIR=/usr/include LUALIB=-llua
	make -C hstore LUA=lua LUAC=luac LUA_INCDIR=/usr/include LUALIB=-llua
}

package() {
	cd "pllua-ng-REL_${pkgver//./_}"

	make DESTDIR="$pkgdir" install LUA=lua
	make -C hstore DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
