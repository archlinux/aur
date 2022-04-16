# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cldr
_project=$_rockname-lua
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=0.2.0.r0.g51e4760
_branch='master'
_rockrel=0
pkgrel=2
pkgdesc='Lua interface to Unicode CLDR data'
arch=(any)
url="https://github.com/alerque/$_project"
license=(MIT custom:ICU)
_luadeps=(penlight)
makedepends=(git
             lua
             lua51
             lua52
             lua53
             luarocks)
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "$_project"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
	cd "$_project"
	depends=("${pkgname%%-*}" "${_luadeps[@]/#/${pkgname%%-*}-}")
	provides=("${pkgname/-git}=$pkgver")
	conflicts=("${pkgname/-git}")
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"
}

package_lua-cldr-git() {
  _package_helper 5.4
}

package_lua53-cldr-git() {
  _package_helper 5.3
}

package_lua52-cldr-git() {
  _package_helper 5.2
}

package_lua51-cldr-git() {
  _package_helper 5.1
}
