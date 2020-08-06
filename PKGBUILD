# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_rockname=zlib
pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
epoch=1
pkgver=1.2
pkgrel=2
url='https://github.com/brimworks/lua-zlib'
pkgdesc='Simple streaming interface to zlib for Lua'
arch=('x86_64')
license=('MIT')
makedepends=('cmake' 'lua' 'lua53' 'lua52' 'lua51' 'zlib')
conflicts=('lua-lzlib')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/brimworks/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('26b813ad39c94fc930b168c3418e2e746af3b2e80b92f94f306f6f954cc31e7d')

build() {
  cp -a "$pkgbase-$pkgver" "lua53-zlib-$pkgver"
  cp -a "$pkgbase-$pkgver" "lua52-zlib-$pkgver"
  cp -a "$pkgbase-$pkgver" "lua51-zlib-$pkgver"
  cd "$srcdir/lua-zlib-$pkgver"
  gcc -o zlib.so -O2 -fPIC -shared lua_zlib.c -llua -lz
  cd "$srcdir/lua53-zlib-$pkgver"
  gcc -o zlib.so -O2 -fPIC -shared -I/usr/include/lua5.3 lua_zlib.c -llua5.3 -lz
  cd "$srcdir/lua52-zlib-$pkgver"
  gcc -o zlib.so -O2 -fPIC -shared -I/usr/include/lua5.2 lua_zlib.c -llua5.2 -lz
  cd "$srcdir/lua51-zlib-$pkgver"
  gcc -o zlib.so -O2 -fPIC -shared -I/usr/include/lua5.1 lua_zlib.c -llua5.1 -lz
}

package_lua-zlib() {
  depends=('zlib' 'lua')
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/lib/lua/5.4/" zlib.so
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" README
}

package_lua53-zlib() {
  depends=('zlib' 'lua53')
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/lib/lua/5.3/" zlib.so
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" README
}

package_lua52-zlib() {
  depends=('zlib' 'lua52')
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/lib/lua/5.2/" zlib.so
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" README
}

package_lua51-zlib() {
  depends=('zlib' 'lua51')
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/lib/lua/5.1/" zlib.so
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" README
}
