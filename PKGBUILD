# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ivy Foster <code@escondida.tk>

_rockname=cosmo
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=16.06.04.r3.ge774f08
pkgrel=1
_rockrel=1
pkgdesc='Safe templates for Lua'
arch=('i686' 'x86_64')
url='http://cosmo.luaforge.net/'
license=('MIT')
_lua_deps=('lpeg')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')

source=("git+https://github.com/mascarenhas/$_rockname.git")
sha256sums=(SKIP)

pkgver() {
	cd "$_rockname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
  cd "$_rockname"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest
}

package_lua-cosmo-git() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.4
}

package_lua53-cosmo-git() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.3
}

package_lua52-cosmo-git() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.2
}

package_lua51-cosmo-git() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.1
}
