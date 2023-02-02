_rockname=nocurses
_project=lua-$_rockname
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=0.0.1
_rockrel=0
pkgrel=1
pkgdesc='Lua terminal screen manipulation library'
arch=(any)
url="https://github.com/osch/$_project"
license=(GPL2)
_luadeps=()
makedepends=(lua
	         lua51
	         lua52
	         lua53
	         luarocks)
_archive="$_project-$pkgver"
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8ead21737cf2e5f06aa186c87460297ff2b853677b473031adbf34e6c2533356')

_package() {
cd "$_archive"
depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		 make --deps-mode=none --no-manifest "rockspecs/$_rockname-scm-$_rockrel.rockspec"
}

package_lua-nocurses() {
_package 5.4
}

package_lua51-nocurses() {
_package 5.1
}

package_lua52-nocurses() {
_package 5.2
}

package_lua53-nocurses() {
_package 5.3
}
