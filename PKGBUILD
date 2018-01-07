# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=(lua-zlib lua51-zlib lua52-zlib)
pkgbase=lua-zlib
epoch=1
pkgver=1.1
pkgrel=1
url="http://github.com/brimworks/lua-zlib"
pkgdesc='Simple streaming interface to zlib for Lua.'
arch=('x86_64')
license=('MIT')
makedepends=('cmake' 'lua' 'lua51' 'lua52' 'zlib' 'git')
conflicts=('lua-lzlib')
source=("lua-zlib-$pkgver.tar.gz::https://github.com/brimworks/lua-zlib/archive/v$pkgver.tar.gz")
sha256sums=('9f0820cc14873248a0c5ae22623cb2fc767fb830e47f6b34b01d71a6e1db2356')

build() {
  cp -a "$srcdir"/lua-zlib-$pkgver "$srcdir"/lua51-zlib-$pkgver
  cp -a "$srcdir"/lua-zlib-$pkgver "$srcdir"/lua52-zlib-$pkgver

  cd "$srcdir"/lua-zlib-$pkgver
  gcc -o zlib.so -O2 -fPIC -shared lua_zlib.c -llua -lz

  cd "$srcdir"/lua51-zlib-$pkgver
  gcc -o zlib.so -O2 -fPIC -shared -I/usr/include/lua5.1 lua_zlib.c -llua5.1 -lz

  cd "$srcdir"/lua52-zlib-$pkgver
  gcc -o zlib.so -O2 -fPIC -shared -I/usr/include/lua5.2 lua_zlib.c -llua5.2 -lz
}

package_lua-zlib() {
  depends=('zlib' 'lua')

  cd "$srcdir"/lua-zlib-$pkgver
  install -Dm0755 zlib.so "$pkgdir"/usr/lib/lua/5.3/zlib.so
  install -Dm644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
}

package_lua51-zlib() {
  depends=('zlib' 'lua51')

  cd "$srcdir"/lua51-zlib-$pkgver
  install -Dm0755 zlib.so "$pkgdir"/usr/lib/lua/5.1/zlib.so
  install -D -m644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
}

package_lua52-zlib() {
  depends=('zlib' 'lua52')

  cd "$srcdir"/lua52-zlib-$pkgver
  install -Dm0755 zlib.so "$pkgdir"/usr/lib/lua/5.2/zlib.so
  install -D -m644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
}
