# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cyan
pkgver=0.4.1
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
sha256sums=('0c6728b2ea8b1f86ca7e545828fa605b162a59b04520ca9c137cc8fd1ba98d06')

package() {
	cd "$pkgname-$pkgver"
	luarocks --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$pkgname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
}
