# Maintainer: Sainan <sainan@calamity.gg>
pkgname=plutolang
pkgdesc="A superset of Lua 5.4 — with unique features, optimizations, and improvements."
pkgver=0.8.2
pkgrel=1
url='https://github.com/PlutoLang/Pluto'
arch=('x86_64')
license=(MIT)
makedepends=(git)
depends=(glibc gcc-libs readline)
conflicts=(pluto)
source=("pluto-git::git+https://github.com/PlutoLang/Pluto#tag=$pkgver")
sha256sums=('SKIP')

build () {
	cd pluto-git/src
	make -j PLAT=linux-readline
}

package () {
	cd pluto-git

	mkdir -p $pkgdir/usr/bin
	cp src/pluto $pkgdir/usr/bin/pluto
	cp src/plutoc $pkgdir/usr/bin/plutoc

	mkdir -p $pkgdir/usr/lib
	cp src/libpluto.a $pkgdir/usr/lib/libpluto.a

	mkdir -p $pkgdir/usr/include/pluto
	cp src/lua.h $pkgdir/usr/include/pluto/lua.h
	cp src/lua.hpp $pkgdir/usr/include/pluto/lua.hpp
	cp src/lualib.h $pkgdir/usr/include/pluto/lualib.h
	cp src/lauxlib.h $pkgdir/usr/include/pluto/lauxlib.h
	cp src/luaconf.h $pkgdir/usr/include/pluto/luaconf.h

	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
