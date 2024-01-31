# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=graph-toolkit
pkgname=("lua51-$_rockname")
# https://github.com/franko/graph-toolkit
# pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.0.r29.g7da648d
_rockrel=1
pkgrel=2
pkgdesc='The Lua Graphics Toolkit, a Lua module for creating plots and graphical animations'
arch=(x86_64)
url="https://github.com/franko/$_rockname"
license=(GPL-3.0-only)
depends=(agg # libagg.so
         freetype2 libfreetype.so)
makedepends=(git
             lua
             lua53
             lua52
             lua51
             luarocks)
_rockspec="$_rockname-scm-$_rockrel.rockspec"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_rockname"
	git describe --long --tags --match 'v[0-9].[0-9]' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package() {
	cd "$_rockname"
	depends=("${pkgname%%-*}") # "liblua$1.so"
	provides=("${pkgname/-git}=$pkgver")
	conflicts=("${pkgname/-git}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "$_rockspec"
}

package_lua-graph-toolkit() {
	_package 5.4
}

package_lua51-graph-toolkit() {
	_package 5.1
}

package_lua52-graph-toolkit() {
	_package 5.2
}

package_lua53-graph-toolkit() {
	_package 5.3
}
