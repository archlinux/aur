# Maintainer: osch <oliver@luced.de>

_rockname=carray
pkgname=lua-$_rockname
pkgver=0.0.5
pkgrel=1
_rockrel=1
pkgdesc="Arrays for primitive numeric C data types in Lua, shareable between C modules"
arch=('x86_64' 'aarch64')
url="https://github.com/osch/lua-$_rockname"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osch/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('3164711b73670c6138ce3407057a566c467a4849d056047d7741d24f0069eced')

package() {
    cd "lua-$_rockname-$pkgver"
    local luaver
    luaver=$(lua -e 'io.write(_VERSION:match("%d+%.%d+"))')
    luarocks --lua-version "$luaver" --tree="$pkgdir/usr" make --deps-mode none \
        "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
    # the rock manifest and its copies of the docs are not part of a package
    rm -rf "$pkgdir/usr/lib/luarocks"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
