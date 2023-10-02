# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=fancytoc.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.1
_rockrel=1
pkgrel=1
pkgdesc='Some fancy table of contents for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c843c32f1968531fb3d7c14c181e2bbccf5deb05d870055abf89e524273816a6')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
