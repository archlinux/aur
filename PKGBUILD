pkgname=lua-lsqlite3
pkgver=0.9.4
pkgrel=2
pkgdesc="A binding for Lua to the SQLite3 database library"
arch=('i686' 'x86_64')
url="http://lua.sqlite.org/"
license=('custom:X11/MIT')
depends=('lua' 'sqlite')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${pkgname#lua-}-$pkgver-$pkgrel.src.rock")
sha512sums=('c1310688fc7c9618cddbbd5cc6181197229dfa891c77461f59916de49a0acd1833b936776efd742ab1c983abf9609a66dc1e8773e9422d06f18cc8eed2a4a217')

package() {
  luarocks --tree="$pkgdir/usr" install "${pkgname#lua-}-$pkgver-$pkgrel.src.rock"

  mkdir -p "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/${pkgname#lua-}/$pkgver-$pkgrel/doc" \
	"$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/${pkgname#lua-}/$pkgver-$pkgrel/examples" \
	"$pkgdir/usr/share/doc/$pkgname/examples"
  sed -ne '/\/\*\*\*/,/\*\*\*\// p' "$pkgdir/usr/share/doc/$pkgname/${pkgname#lua-}.wiki" \
	> "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  rm -rf "$pkgdir/usr/lib/luarocks"
}

