# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=repl
_project=lua-repl
_pkgname=luarepl
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9
_rockrel=1
pkgrel=5
pkgdesc='A reusable REPL component for Lua, written in Lua'
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/$_project"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3c88a3b102a4a4897c46fadb2cd12ee6760438e41e39ffc6cf353582d651b313')

_package_helper() {
  cd "$_project-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_pkgname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}

package_lua-repl() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-repl() {
  depends+=('lua53')
  _package_helper 5.3
  mv "$pkgdir"/usr/bin/rep.lua{,53}
}

package_lua52-repl() {
  depends+=('lua52')
  _package_helper 5.2
  mv "$pkgdir"/usr/bin/rep.lua{,52}
}

package_lua51-repl() {
  depends+=('lua51')
  _package_helper 5.1
  mv "$pkgdir"/usr/bin/rep.lua{,51}
}
