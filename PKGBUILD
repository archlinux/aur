# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-fluent-git
pkgver=0.0.4.r58.ge093976
_branch='master'
_rockname=fluent
_rockrel=0
pkgrel=1
pkgdesc="Lua implementation of Project Fluent."
arch=('any')
url="https://github.com/alerque/lua-fluent"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=('lua-fluent')
source=("git://github.com/alerque/fluent-lua.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fluent-lua"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/fluent-lua"
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-scm-$_rockrel.rockspec"
    find "$pkgdir/usr" -name manifest -delete
}
