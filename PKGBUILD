# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=resilient.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.3.0
_rockrel=1
pkgrel=1
pkgdesc='Advanced book classes and packages for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(barcodes
           couyards
           embedders
           fancytoc
           labelrefs
           markdown
           printoptions
           ptable
           qrcode
           silex
           textsubsuper)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6afb5815938e133c71502867f2c77be5cbb11f46aca306576d8dd99ad1f2e972')

package() {
	cd "$_archive"
	luarocks --lua-version=5.1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
