# Maintainer: osch <oliver@luced.de>

_rockname=digest
pkgname=lua-$_rockname
pkgver=0.0.1
pkgrel=1
_rockrel=1
pkgdesc="MD5, SHA-256/384/512 and HMAC for Lua (one-shot and streaming)"
arch=('x86_64' 'aarch64')
url="https://github.com/osch/lua-$_rockname"
license=('MIT' 'BSD-3-Clause')
depends=('lua')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osch/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('bfc261ffb78e133c19669fe41bd57098d83f4866d7c340a2a6f7a4521cad3043')

package() {
    cd "lua-$_rockname-$pkgver"
    local luaver
    luaver=$(lua -e 'io.write(_VERSION:match("%d+%.%d+"))')
    luarocks --lua-version "$luaver" --tree="$pkgdir/usr" make --deps-mode none \
        "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
    # the rock manifest and its copies of the docs are not part of a package
    rm -rf "$pkgdir/usr/lib/luarocks"
    install -Dm644 LICENSE LICENSE-THIRD-PARTY -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
