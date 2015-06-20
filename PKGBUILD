# Maintainer: zopieux <web+oss at zopieux dot com>

_lua_version=5.3

pkgname=lua-cjson
pkgver=2.1.0
pkgrel=3
pkgdesc="A fast JSON parsing and encoding support for Lua."
arch=(i686 x86_64)
url="http://www.kyne.com.au/~mark/software/lua-cjson.php"
license=('custom:MIT')
depends=("lua")
optdepends=('perl: UTF8 implementation test')
source=("http://www.kyne.com.au/~mark/software/download/$pkgname-$pkgver.tar.gz")
md5sums=('24f270663e9f6ca8ba2a02cef19f7963')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LUA_INCLUDE_DIR=/usr/include/lua${_lua_version} LUA_VERSION=${_lua_version}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" LUA_INCLUDE_DIR=/usr/include/lua${_lua_version} LUA_VERSION=${_lua_version} install{,-extra}

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
