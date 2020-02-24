# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.14.0
_rockrel=1
pkgrel=3
pkgdesc='Coverage analysis tool for Lua scripts'
arch=('i686' 'x86_64')
url="https://keplerproject.github.io/$_rockname"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/keplerproject/$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('b48eb004f0a74bc64aa1419d9999057b9595668c37abfa4a126de4083d89ef44')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}

package_lua-luacov() {
  _package_helper 5.3
}

package_lua52-luacov() {
  depends+=('lua52')
  _package_helper 5.2
  rm "$pkgdir"/usr/bin/luacov
}

package_lua51-luacov() {
  depends+=('lua51')
  _package_helper 5.1
  rm "$pkgdir"/usr/bin/luacov
}
