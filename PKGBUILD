# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_rockname=posix
pkgbase=lua-$_rockname-git
_pkgbase=luaposix
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=33.4.0.r172.g1ff80ab
_rockrel=1
pkgrel=1
pkgdesc="POSIX bindings for Lua"
arch=('x86_64' 'i686')
url="https://github.com/$_pkgbase/$_pkgbase"
license=('MIT')
makedepends=('git' 'ldoc' 'lua' 'lua53' 'lua52' 'lua51' 'luarocks')
_lua_deps=('std-normalize')
source=("git://github.com/$_pkgbase/$_pkgbase.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long --always --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
    cd "$_pkgbase"
    luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
        make --deps-mode=none --no-manifest "$_pkgbase-git-$_rockrel.rockspec"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_lua-posix-git() {
    depends=('lua' "${_lua_deps[@]/#/lua-}")
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    _package_helper 5.4
}

package_lua53-posix-git() {
    depends=('lua53' "${_lua_deps[@]/#/lua53-}")
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    _package_helper 5.3
}

package_lua52-posix-git() {
    depends=('lua52' "${_lua_deps[@]/#/lua52-}")
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    _package_helper 5.2
}

package_lua51-posix-git() {
    depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    _package_helper 5.1
}
