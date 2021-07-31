# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cyan
pkgver=0.1.0
pkgrel=1
pkgdesc="The Teal build system and project manager"
arch=(any)
url=https://github.com/teal-language/$pkgname
license=(MIT)
_lua_deps=(argparse
           filesystem
           tl)
depends=(lua "${_lua_deps[@]/#/lua-}")
makedepends=(luarocks)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d40cd2a130c9304d2534e3dc8b2f22a3f9d3d398e77ec2a788e22b5d50471984')

package() {
	cd "$pkgname-$pkgver"
	luarocks --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$pkgname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
