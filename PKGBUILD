# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=path
pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.3.1
_rockrel=1
pkgrel=5
pkgdesc='File system path manipulation library'
arch=(i686 x86_64)
url="https://github.com/moteus/$pkgbase"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$pkgbase-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f7419d9012cb5005a9adbc6e567fee44832a42a73532451336de066ff2ebcce5')

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE.txt
}

package_lua-path() {
	_package 5.4
}

package_lua51-path() {
	_package 5.1
}

package_lua52-path() {
	_package 5.2
}

package_lua53-path() {
	_package 5.3
}
