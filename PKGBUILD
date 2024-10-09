# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cyan
pkgver=0.4.0
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
sha256sums=('7e367c8d29883af0fde17abfc4fb6cb4cc9f7cebdcba069617b27c8d61fc5662')

package() {
	cd "$pkgname-$pkgver"
	luarocks --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$pkgname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
