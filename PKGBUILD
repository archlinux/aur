# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

_rockname=posix
pkgbase=lua-$_rockname
_pkgbase="${pkgbase//-}"
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=34.1.1
_rockrel=1
pkgrel=3
pkgdesc="POSIX bindings for Lua"
arch=('x86_64' 'i686')
url="https://github.com/$_pkgbase/$_pkgbase"
license=('MIT')
makedepends=('luarocks' 'lua52' 'lua51')
_lua_deps=('std-normalize')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/release-v$pkgver.tar.gz")
sha256sums=('273df2dbd9581a2f22e4265f14d0d759c487c0c9830f94395d7d690474382810')

_package_helper() {
    cd "$_pkgbase-release-v$pkgver"
    luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
        make --deps-mode=none --no-manifest "$_pkgbase-$pkgver-$_rockrel.rockspec"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lua-posix() {
    depends+=('lua' "${_lua_deps[@]/#/lua-}")
    _package_helper 5.3
}

package_lua52-posix() {
    depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
    _package_helper 5.2
}

package_lua51-posix() {
    depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
    _package_helper 5.1
}
