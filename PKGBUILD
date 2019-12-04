_pkgname='lua-lsp'
pkgname='lua-lsp-git'
pkgver=0
pkgrel=20190922
pkgdesc='A Lua language server'
lua_ver=5.3
arch=('any')
url='https://github.com/Alloyed/lua-lsp'
source=(
	"$pkgname::git+https://github.com/Alloyed/lua-lsp"
	"luainspect.patch"
)
sha1sums=(
	'SKIP'
	'da00ccf057c111fe9c6e0b51113526e697953e4c'
)
license=('MIT')
depends=('lua-dkjson' 'lua-luainspect-git' 'lua-lpeglabel-git')

package() {
  patch -p0 -i luainspect.patch
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	install -m 644 $srcdir/$pkgname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/lua/$lua_ver
	install -m 755 $srcdir/$pkgname/bin/$_pkgname $pkgdir/usr/bin
	cp -r $srcdir/$pkgname/$_pkgname $pkgdir/usr/share/lua/$lua_ver/
	chmod 755 -R $pkgdir/usr/share/lua/$lua_ver/$_pkgname
}
