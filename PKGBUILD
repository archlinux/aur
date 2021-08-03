# Maintainer: osch <oliver@luced.de>

_pkgluaname=lpugl
pkgname=lua-$_pkgluaname
pkgver=0.0.1
_luacmd="lua"
pkgrel=1
_rockrel=1
pkgdesc="Minimal Lua-API for building cross platform GUIs"
arch=("i686" "x86_64")
url="https://github.com/osch/lua-lpugl#lpugl"
license=("MIT")
depends=("lua" "lua-oocairo" "libgl")
source=("https://github.com/osch/lua-$_pkgluaname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/$pkgname-$pkgver"/src
	sed -i -e "s/LPUGL_VERSION=Makefile-1/LPUGL_VERSION=$pkgver/" Makefile
	make
	cd build
	install -D -t "$pkgdir/usr/lib/lua/$_luaver/"   -m "u=rwx,go=rx" lpugl.so lpugl_cairo.so lpugl_opengl.so 
	cd ../../
	install -D -t "$pkgdir/usr/share/doc/$pkgname/"      -m "u=rw,go=r"  doc/README.md
	install -D -t "$pkgdir/usr/share/licenses/$pkgname/" -m "u=rw,go=r"  LICENSE
}

md5sums=('7d9408f67a69790262b22e5618f45448')
