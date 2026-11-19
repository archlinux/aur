# Maintainer: osch <oliver@luced.de>

_rockname=lpcre
pkgname=lua-$_rockname
pkgver=0.0.1
pkgrel=1
_rockrel=1
pkgdesc="PCRE2 regular expressions for Lua strings and carrays"
arch=('x86_64' 'aarch64')
url="https://github.com/osch/lua-$_rockname"
license=('MIT')
depends=('lua' 'pcre2')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osch/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('42d3708e1eb71a09f8f59932b81c9a3754d22550f1f39758f73d749a84600514')

package() {
    cd "lua-$_rockname-$pkgver"
    local luaver
    luaver=$(lua -e 'io.write(_VERSION:match("%d+%.%d+"))')
    luarocks --lua-version "$luaver" --tree="$pkgdir/usr" make --deps-mode none \
        "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec" PCRE2_LIBDIR=/usr/lib
    # the rock manifest and its copies of the docs are not part of a package
    rm -rf "$pkgdir/usr/lib/luarocks"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
