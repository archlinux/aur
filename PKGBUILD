# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luarepl
pkgname=('lua-repl' 'lua52-repl' 'lua51-repl')
pkgver=0.9
_rockrel=1
pkgrel=2
pkgdesc="A reusable REPL component for Lua, written in Lua"
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/lua-repl"
license=('MIT')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/hoelzro/lua-repl/archive/$pkgver.tar.gz")
sha256sums=('3c88a3b102a4a4897c46fadb2cd12ee6760438e41e39ffc6cf353582d651b313')

_package_helper() {
  cd "lua-repl-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir" -name rep.lua -delete # test file
}

package_lua-repl() {
  depends+=('lua')
  _package_helper 5.3
}

package_lua52-repl() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-repl() {
  depends+=('lua51')
  _package_helper 5.1
}
