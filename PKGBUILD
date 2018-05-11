# Maintainer: Craig Barnes (cbb)
# Contributor: felix

pkgbase=lua-gumbo-git
pkgname=(lua-gumbo-git lua52-gumbo-git lua51-gumbo-git)
pkgver=0.4+331+gc340c15
pkgrel=1
pkgdesc='Lua HTML5 parser and DOM API'
arch=(i686 x86_64)
url="https://craigbarnes.github.io/lua-gumbo/"
license=('Apache')
makedepends=(git lua lua52 lua51)
source=(git+https://github.com/craigbarnes/lua-gumbo.git)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/lua-gumbo"
    git describe | tr - +
}

build() {
    cd "$srcdir/lua-gumbo"
    make build-all V=1
}

check() {
    cd "$srcdir/lua-gumbo"
    make check-all
}

_package_ver() {
    cd "$srcdir/lua-gumbo"
    make "install-$1" V=1 DESTDIR="$pkgdir/"
}

package_lua-gumbo-git() {
    provides=('lua53-gumbo-git')
    depends=(lua)
    _package_ver lua53
}

package_lua52-gumbo-git() {
    depends=(lua52)
    _package_ver lua52
}

package_lua51-gumbo-git() {
    depends=(lua51)
    _package_ver lua51
}
