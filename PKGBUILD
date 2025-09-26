# Maintainer: Sainan <sainan@calamity.gg>
pkgname=plutolang
pkgdesc="A superset of Lua 5.4 with a focus on general-purpose programming."
pkgver=0.12.1
pkgrel=1
url='https://github.com/PlutoLang/Pluto'
arch=('x86_64')
license=(MIT)
makedepends=(git)
depends=(glibc gcc-libs readline)
provides=(libpluto.so)
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
	#cp src/libplutostatic.a $pkgdir/usr/lib/libplutostatic.a
	cp src/libpluto.so $pkgdir/usr/lib/libpluto.so

	mkdir -p $pkgdir/usr/include/pluto
	cp src/lua.h $pkgdir/usr/include/pluto/lua.h
	cp src/lua.hpp $pkgdir/usr/include/pluto/lua.hpp
	cp src/lualib.h $pkgdir/usr/include/pluto/lualib.h
	cp src/lauxlib.h $pkgdir/usr/include/pluto/lauxlib.h
	cp src/luaconf.h $pkgdir/usr/include/pluto/luaconf.h

	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
