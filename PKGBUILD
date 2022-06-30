# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=optparse
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.4
_rockrel=1
pkgrel=1
pkgdesc='Parse and process command-line options'
arch=(any)
url="https://gvvaughan.github.io/$_rockname"
_url="https://github.com/gvvaughan/$_rockname"
license=(MIT)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
_rockspec="$_archive-$_rockrel.rockspec"
_rock="$_archive-$_rockrel.all.rock"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('fbb43a6139e9b3a992883f24bd32982fcee0028a3500f40f2b58597aa87a519e')

build() {
	cd "$_archive"
	for LUAVER in 5.{1,2,3,4}; do
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- $_rockspec
		install -Dm0644 -t "lua-$LUAVER/" "$_rock"
	done
}

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua-$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}

package_lua-optparse() {
  _package 5.4
}

package_lua51-optparse() {
  _package 5.1
}

package_lua52-optparse() {
  _package 5.2
}

package_lua53-optparse() {
  _package 5.3
}
