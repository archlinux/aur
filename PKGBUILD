# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgbase=lua-periphery
pkgname=(lua-periphery lua51-periphery lua52-periphery lua53-periphery)

pkgver=2.3.1
pkgrel=1
_commit=b9a784fc6bb4b93a5a326731360a055931f02ae4
pkgdesc='A Lua library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux.'
arch=('x86_64')
url='https://github.com/vsergeev/lua-periphery'
license=('MIT')
#options=('debug')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'git')
source=("git+https://github.com/vsergeev/lua-periphery.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/lua-periphery"
  git submodule update --init --recursive

  cd "$srcdir"
  cp -a lua-periphery lua-periphery-51
  cp -a lua-periphery lua-periphery-52
  cp -a lua-periphery lua-periphery-53
}

build() {
  cd "$srcdir"/lua-periphery-51
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS LUA=lua51 make

  cd "$srcdir"/lua-periphery-52
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS LUA=lua52 make

  cd "$srcdir"/lua-periphery-53
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS LUA=lua53 make

  cd "$srcdir"/lua-periphery
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS LUA=lua54 make
}

package_lua51-periphery() {
  cd lua-periphery-51
  install -D -m644 periphery.so "$pkgdir/usr/lib/lua/5.1/periphery.so"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-periphery() {
  cd lua-periphery-52
  install -D -m644 periphery.so "$pkgdir/usr/lib/lua/5.2/periphery.so"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-periphery() {
  cd lua-periphery-53
  install -D -m644 periphery.so "$pkgdir/usr/lib/lua/5.3/periphery.so"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-periphery() {
  cd lua-periphery
  install -D -m644 periphery.so "$pkgdir/usr/lib/lua/5.4/periphery.so"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}