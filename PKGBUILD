# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_rockname=moonscript
_rockver=0.5.0
_rockrel=1

pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=$_rockver
pkgrel=1
pkgdesc='Dynamic scripting language that compiles into Lua'
url='https://moonscript.org'
license=('MIT')
arch=(any)
makedepends=(luarocks lua lua51 lua52 lua53)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/leafo/moonscript/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1adb5bb38f9c6f306250f6e90d92796fe100408ee062ac0d14f3c4c22c92e682')
b2sums=('bda1e8fcd0191e8525ed6a7ecaf393712e24f8242b1dba5019b03f539d1e9acaa74faf67a1e3acddbb9b05f5cb570496d9910ff4f3a86986f2a8aa92234b41ef')

_package() {
  depends+=("${pkgname%-*}")

  cd "$_rockname-$_rockver"

  local lua_version="$1"
  local lua_base="$2"
  depends+=("$lua_base-lpeg" "$lua_base-filesystem" "$lua_base-alt-getopt")

  luarocks --lua-version="$lua_version" --tree="$pkgdir/usr" \
    make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"

  rm -rf "$pkgdir/usr/bin" "$pkgdir/usr/lib/luarocks/rocks-$lua_version/$_rockname/$_rockver-$_rockrel/bin"
}

package_lua-moonscript() {
  _package 5.4 lua
}

package_lua51-moonscript() {
  _package 5.1 lua51
}

package_lua52-moonscript() {
  _package 5.2 lua52
}

package_lua53-moonscript() {
  _package 5.3 lua53
}
