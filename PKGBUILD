# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

_rockname=copas
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=4.8.0
_rockrel=1
pkgrel=1
pkgdesc='A dispatcher based on coroutines that can be used by TCP/IP servers'
arch=(x86_64 i686)
url="https://lunarmodules.github.io/$_rockname"
_url="https://github.com/lunarmodules/$_rockname"
license=(MIT)
_luadeps=(binaryheap
          socket
          timerwheel)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
_rockspec="rockspec/$_archive-$_rockrel.rockspec"
source=("$_url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('8975fe3ef7bd6253208dec4b9b2390fdff3b682ce4fc9116f3bdb90a1d637291')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_rockspec"
	if [[ $1 != 5.4 ]]; then
		rm -f $pkgdir/usr/bin/$_rockname
	fi
}

package_lua-copas() {
	depends+=("${pkgname%%-*}" "${_luadeps[@]/#/${pkgname%%-*}-}")
	optdepends+=("${pkgname%%-*}-sec: secure sockets support")
	_package 5.4
}

package_lua53-copas() {
	depends+=("${pkgname%%-*}" "${_luadeps[@]/#/${pkgname%%-*}-}")
	optdepends+=("${pkgname%%-*}-sec: secure sockets support")
	_package 5.3
}

package_lua52-copas() {
	depends+=("${pkgname%%-*}" "${_luadeps[@]/#/${pkgname%%-*}-}")
	optdepends+=("${pkgname%%-*}-sec: secure sockets support")
	_package 5.2
}

package_lua51-copas() {
	depends+=("${pkgname%%-*}" "${_luadeps[@]/#/${pkgname%%-*}-}")
	depends+=(lua51-coxpcall)
	optdepends+=("${pkgname%%-*}-sec: secure sockets support")
	_package 5.1
}
