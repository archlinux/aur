# Maintainer: Craig Barnes (cbb)
# Contributor: felix

pkgbase=lua-gumbo-git
pkgname=(lua-gumbo-git lua52-gumbo-git lua51-gumbo-git)
pkgver=0.4+153+g129a10c
pkgrel=1
pkgdesc='Lua HTML5 parser and DOM API'
arch=(i686 x86_64)
url="https://craigbarnes.github.io/lua-gumbo/"
license=('custom:ISC')
makedepends=(git lua lua52 lua51)
source=(git+https://github.com/craigbarnes/lua-gumbo.git)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/lua-gumbo"
    git describe | tr - +
}

build() {
    cd "$srcdir/lua-gumbo"
    make build-all
}

check() {
    cd "$srcdir/lua-gumbo"
    make check-all
}

_package_ver() {
    cd "$srcdir/lua-gumbo"
    make "install-$1" DESTDIR="$pkgdir/"
    install -Dm0644 "$srcdir/lua-gumbo/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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
