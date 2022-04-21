# Maintainer: zopieux <web+oss at zopieux dot com>

pkgbase=lua-cjson
pkgname=(lua-cjson lua51-cjson lua52-cjson lua53-cjson)
pkgver=2.1.0
pkgrel=5
_tag=${pkgver}
pkgdesc='A fast JSON parsing and encoding support for Lua.'
arch=('x86_64')
url='https://www.kyne.com.au/~mark/software/lua-cjson.php'
license=('custom:MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53')
optdepends=('perl: UTF8 implementation test')
source=(
  "https://www.kyne.com.au/~mark/software/download/$pkgname-$pkgver.tar.gz"
  'no-tests.patch')
sha256sums=('51bc69cd55931e0cba2ceae39e9efa2483f4292da3a88a1ed470eda829f6c778'
            'f19c685cbc345c14c6df86979b3150e74c1e99da091f7b3c6d9841bf2fee4114')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/no-tests.patch"
}

build() {
  cp -a lua-cjson-${_tag} lua-cjson-${_tag}-51
  make -C lua-cjson-${_tag}-51 PREFIX=/usr LIB_OPTION="-shared ${LDFLAGS}" LUA_VERSION=5.1

  cp -a lua-cjson-${_tag} lua-cjson-${_tag}-52
  make -C lua-cjson-${_tag}-52 PREFIX=/usr LIB_OPTION="-shared ${LDFLAGS}" LUA_VERSION=5.2

  cp -a lua-cjson-${_tag} lua-cjson-${_tag}-53
  make -C lua-cjson-${_tag}-53 PREFIX=/usr LIB_OPTION="-shared ${LDFLAGS}" LUA_VERSION=5.3

  make -C lua-cjson-${_tag} PREFIX=/usr LIB_OPTION="-shared ${LDFLAGS}" LUA_VERSION=5.4
}

package_lua51-cjson() {
  cd lua-cjson-${_tag}-51
  make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.1 install{,-extra}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-cjson() {
  cd lua-cjson-${_tag}-52
  make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.2 install{,-extra}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua53-cjson() {
  cd lua-cjson-${_tag}-53
  make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.3 install{,-extra}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua-cjson() {
  cd lua-cjson-${_tag}
  make DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.4 install{,-extra}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
