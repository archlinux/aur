# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
_project=$_rockname.lua
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=2.3.1.r4.gfa4d058
_rockrel=0
pkgrel=1
pkgdesc='The cassowary constraint solver'
arch=(any)
url="https://github.com/sile-typesetter/$_project"
license=(MIT)
_lua_deps=(penlight)
makedepends=(git
             lua
             lua51
             lua52
             lua53
             luarocks)
source=("$_project.git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_project.git"
	git describe --always --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
	cd "$_project.git"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-cassowary-git() {
	depends=('lua' "${_lua_deps[@]/#/lua-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package_helper 5.4
}

package_lua53-cassowary-git() {
	depends=('lua53' "${_lua_deps[@]/#/lua53-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package_helper 5.3
}

package_lua52-cassowary-git() {
	depends=('lua52' "${_lua_deps[@]/#/lua52-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package_helper 5.2
}

package_lua51-cassowary-git() {
	depends=('lua51' "${_lua_deps[@]/#/lua51-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package_helper 5.1
}
