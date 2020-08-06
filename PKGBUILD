# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov-coveralls
pkgbase=lua-$_rockname-git
pkgname=lua53-$_rockname-git
pkgver=0.2.2.r15.g2cd56f0
_rockrel=0
pkgrel=1
pkgdesc='LuaCov reporter for coveralls.io service'
arch=('any')
url="https://github.com/moteus/$_rockname"
license=('MIT')
depends=('lua53' 'lua53-dkjson' 'lua53-filesystem' 'lua53-luacov' 'lua53-path')
makedepends=('luarocks')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_rockname"
  git describe --always --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_rockname"
  luarocks --tree="$pkgdir/usr/" \
    make --deps-mode=none "rockspecs/$_rockname-scm-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
