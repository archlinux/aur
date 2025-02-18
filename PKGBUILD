# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=colors
_project=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=8.05.26
_rockrel=0
pkgrel=7
pkgdesc='HSL Color Theory Computation in Lua'
arch=(any)
url="http://sputnik.freewisdom.org/lib/$_rockname"
_url="https://github.com/yuri/$_project"
license=(MIT)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
source=("http://sputnik.freewisdom.org/files/$_archive.tar.gz")
sha256sums=('64ec89fb6938cfdadca5ba1dc9c549dc61c62a585bb8ff5ac593b33b709f814b')

build() {
	cd "$_archive"
	for LUAVER in 5.{1,2,3,4}; do
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- rockspec
		install -Dm0644 -t "lua-$LUAVER/" "$_rock"
	done
}

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua-$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_lua-colors() {
  _package 5.4
}

package_lua51-colors() {
  _package 5.1
}

package_lua52-colors() {
  _package 5.2
}

package_lua53-colors() {
  _package 5.3
}
