# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov-coveralls
pkgname=lua-$_rockname-git
pkgver=0.2.2.r13.gbc06063
_rockrel=0
pkgrel=1
pkgdesc='LuaCov reporter for coveralls.io service'
arch=('any')
url="https://github.com/moteus/$_rockname"
license=('MIT')
depends=('lua' 'lua-dkjson' 'lua-filesystem' 'lua-luacov' 'lua-path')
makedepends=('luarocks')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_rockname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_rockname"
  luarocks --tree="$pkgdir/usr/" \
    make --deps-mode=none "rockspecs/$_rockname-scm-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
