# Maintainer: archlinux.info:tdy

pkgname=lua52-posix
pkgver=33.4.0
pkgrel=1
pkgdesc="Lua 5.2 bindings for POSIX APIs"
arch=(i686 x86_64)
url=https://github.com/luaposix/luaposix
license=(MIT)
depends=(lua52)
source=(https://github.com/luaposix/luaposix/archive/release-v$pkgver.tar.gz)
sha256sums=(e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21)

prepare() {
  cd luaposix-release-v$pkgver
  export LUA=/usr/bin/lua5.2
  export LUA_INCLUDE=-I/usr/include/lua5.2
}

build() {
  cd luaposix-release-v$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/lua/5.2 --datadir=/usr/share/lua/5.2
  make
}

check() {
  cd luaposix-release-v$pkgver
  make -k check
}

package() {
  cd luaposix-release-v$pkgver
  make DESTDIR="$pkgdir" install
  install COPYING -m 644 -Dt "$pkgdir"/usr/share/licenses/$pkgname/
}
