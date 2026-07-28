# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgbase=lua-mumble
pkgname=(lua51-mumble lua52-mumble lua53-mumble lua54-mumble)

pkgver=1.0.0
pkgrel=1
_commit=8dd6b9c01917d6180d7e3b8e316a69de45121d9b
pkgdesc='A lua module to connect to a mumble server and interact with it '
arch=('x86_64')
url='https://github.com/bkacjios/lua-mumble'
license=('MIT')
depends=('libuv' 'openssl' 'libsndfile' 'opus')
makedepends=('cmake' 'pkgconf' 'protobuf-c' 'lua' 'lua51' 'lua52' 'lua53' 'git')
source=("git+https://github.com/bkacjios/lua-mumble.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  cp -a lua-mumble lua-mumble-51
  cp -a lua-mumble lua-mumble-52
  cp -a lua-mumble lua-mumble-53
}

build() {
  ls "$srcdir"

  cd "$srcdir/lua-mumble-51"
  mkdir build && cd build
  cmake -DLUAVER=lua51 --fresh
  make

  cd "$srcdir/lua-mumble-52"
  mkdir build && cd build
  cmake -DLUAVER=lua52 --fresh
  make

  cd "$srcdir/lua-mumble-53"
  mkdir build && cd build
  cmake -DLUAVER=lua53 --fresh
  make

  cd "$srcdir/lua-mumble"
  mkdir build && cd build
  cmake -DLUAVER=lua54 --fresh
  make
}

package_lua51-mumble() {
  cd lua-mumble-51
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  install -D -m644 mumble.so "$pkgdir/usr/lib/lua/5.1/mumble.so"
}

package_lua52-mumble() {
  cd lua-mumble-52
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  install -D -m644 mumble.so "$pkgdir/usr/lib/lua/5.2/mumble.so"
}

package_lua53-mumble() {
  cd lua-mumble-53
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  install -D -m644 mumble.so "$pkgdir/usr/lib/lua/5.3/mumble.so"
}

package_lua54-mumble() {
  cd lua-mumble
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  install -D -m644 mumble.so "$pkgdir/usr/lib/lua/5.4/mumble.so"
}