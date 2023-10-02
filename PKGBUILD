# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=textsubsuper.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.0
_rockrel=1
pkgrel=1
pkgdesc='Real or fake superscripts and subscripts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('da2c71e6d83f623b245c7a7eedfa37e6190656e92742b30debc85e612acfb9b6')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
