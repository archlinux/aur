# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-cldr-git
pkgver=0.0.0.r2.g77065e7
_branch='master'
_rockname=cldr
_rockrel=0
pkgrel=1
pkgdesc="Unicode CLDR data and Lua interface."
arch=('any')
url="https://github.com/alerque/lua-cldr"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("git://github.com/alerque/cldr-lua.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cldr-lua"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/cldr-lua"
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-scm-$_rockrel.rockspec"
    find "$pkgdir/usr" -name manifest -delete
}
