# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=smartquotes.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.0.0
_rockrel=1
pkgrel=1
pkgdesc='Typographic quotation marks with the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4cfaabfa9f789bc2e04195f2a9aba6d2cf4523b029dcb594297aa414916f7469')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
