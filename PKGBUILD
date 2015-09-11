pkgname=lua-lsqlite3
pkgver=0.9.3
pkgrel=0
pkgdesc="A binding for Lua to the SQLite3 database library"
arch=('i686' 'x86_64')
url="http://lua.sqlite.org/"
license=('custom:X11/MIT')
depends=('lua' 'sqlite')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${pkgname#lua-}-$pkgver-$pkgrel.src.rock")
sha512sums=('33c844f4c9bf60a4d6755071555cbb5af72e1c9e4fc0bd0bafa8b0e08f03d1cca8289c7afaf927d464ab84446355c23ab0f83ae60e577566506233b67dd50b43')

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

