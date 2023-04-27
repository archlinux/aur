# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cyan
pkgver=0.3.0
pkgrel=1
pkgdesc="The Teal build system and project manager"
arch=(any)
url=https://github.com/teal-language/$pkgname
license=(MIT)
_lua_deps=(argparse
           filesystem
           tl)
depends=(lua
         "${_lua_deps[@]/#/lua-}"
         teal)
makedepends=(luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a546efebd4c536cb181af8666bd3b63bfe37bb5041e79439ce308c16048200b')

package() {
	cd "$pkgname-$pkgver"
	luarocks --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$pkgname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
