# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-busted
pkgver=2.0.0
_rockname=busted
_rockrel=1
pkgrel=3
pkgdesc="Elegant Lua unit testing."
arch=('i686' 'x86_64')
url="http://olivinelabs.com/busted/"
license=('MIT')
_lua_deps=('cliargs' 'dkjson' 'filesystem' 'luassert' 'mediator' 'penlight' 'say' 'system' 'term')
depends=('lua' "${_lua_deps[@]/#/lua-}")
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('7cb1d99772b5c7df08f7798ffb0e5b06c392a778f6b1ab923dc6d02e57497c31')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  sed -i -e "s#$pkgdir##" "$pkgdir/usr/bin/busted"
  find "$pkgdir/usr" -name manifest -delete
}
