# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

_rockname=bit32
pkgname=( "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgbase=lua-$_rockname
_compatrel=0.9
pkgver=5.3.5_$_compatrel
_rockrel=1
pkgrel=2
pkgdesc='Lua 5.2 bit manipulation library'
arch=('x86_64' 'i686')
url='https://www.lua.org/manual/5.2/manual.html#6.7'
license=('MIT')
makedepends=('luarocks' 'lua' 'lua53' 'lua52' 'lua51')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/lua-compat-5.3/archive/v${_compatrel}.tar.gz")
sha256sums=('ad05540d2d96a48725bb79a1def35cf6652a4e2ec26376e2617c8ce2baa6f416')

_package_helper() {
  cd "lua-compat-5.3-$_compatrel"
  luarocks --lua-version=$1 --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspecs/$_rockname-${pkgver%_$_compatrel}-$_rockrel.rockspec"
}

package_lua-bit32() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-bit32() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-bit32() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-bit32() {
  depends+=('lua51')
  _package_helper 5.1
}
