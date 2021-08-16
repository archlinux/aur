# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.25.0
pkgrel=1
pkgdesc="A tool for linting and static analysis of Lua code."
arch=('any')
url="https://github.com/luarocks/luacheck"
license=('MIT')
depends=('lua' 'lua-filesystem' 'lua-argparse')
optdepends=('lua-lanes: for parallel checking')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luarocks/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4507648bee9e67b2d30058f7befbbb58cd387a2503f4f348c2aae6e93417aaa1')

package() {
  cd "$pkgname-$pkgver"
  LUA_VERSION=5.4
  for subdir in . builtin_standards stages vendor/sha1; do
    find src/luacheck/$subdir -maxdepth 1 -type f -exec install -Dm644 {} -t "$pkgdir/usr/share/lua/$LUA_VERSION/luacheck/$subdir" \;
  done
  install -Dm755 "bin/luacheck.lua" "$pkgdir/usr/bin/luacheck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
