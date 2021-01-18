# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov-coveralls
pkgbase=lua-$_rockname
pkgname=lua53-$_rockname
pkgver=0.2.3
_rockrel=1
pkgrel=1
pkgdesc='LuaCov reporter for coveralls.io service'
arch=('any')
url="https://github.com/moteus/$_rockname"
license=('MIT')
depends=('lua53' 'lua53-dkjson' 'lua53-filesystem' 'lua53-luacov' 'lua53-path')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fc293b3780783f263469d49fb4d17b2151ba2a7693377673d1cb8eb1576d1d3')

package() {
  cd "$_rockname-$pkgver"
  luarocks --tree="$pkgdir/usr/" \
    make --deps-mode=none "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
