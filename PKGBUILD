# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cyan
pkgver=0.3.1
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
sha256sums=('e06affe2180cff8f7e05e970cbc8d685124950aa282797a7aba04d320c84e56f')

package() {
	cd "$pkgname-$pkgver"
	luarocks --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$pkgname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
