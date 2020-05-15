# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lcf
_pkgname=lua_code_formatter
pkgname=lua-lcf
pkgver=5.3
_rockrel=4
pkgrel=2
pkgdesc='Lua code formatter'
arch=('any')
url="https://github.com/martin-eden/$_pkgname"
license=('GPL')
depends=('lua')
makedepends=('luarocks')
conflicts=('lua51-lcf')
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver-$_rockrel.tar.gz")
sha256sums=('70d8894ee54a955c80bdd96e2db40f33239b5e3f570778ae0fb64d2da3e7df4c')

package() {
  cd "$_pkgname-$pkgver-$_rockrel"
  luarocks --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-1.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
