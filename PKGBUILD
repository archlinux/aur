_rockname=fennel
_project=lua-$_rockname
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=1.3.1
_rockrel=1
pkgrel=1
pkgdesc='Lisp that compiles to Lua'
arch=(any)
url="https://github.com/bakpakin/Fennel"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="Fennel-$pkgver"
source=("$_rockname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('12045cbd70088b966e73ac4c54ad63e096fb9b91b9874cb17533c8045595ee74')

_package() {
    cd "$_archive"
    depends=("${pkgname%-*}")
    LUA="lua$1" make fennel fennel.lua
    luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
             make --deps-mode=none --no-manifest "rockspecs/${_rockname}-${pkgver}-${_rockrel}.rockspec"
    mv $pkgdir/usr/bin/$_rockname $pkgdir/usr/bin/lua$1-$_rockname
}

package_lua-fennel() {
    _package 5.4
}

package_lua51-fennel() {
    _package 5.1
}

package_lua52-fennel() {
    _package 5.2
}

package_lua53-fennel() {
    _package 5.3
}
