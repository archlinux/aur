# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=resilient.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.2.1
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
sha256sums=('8f08b554a22b647a023e483ae9346b0ad375d17570599eb381faf6d1a5d882a0')

package() {
	cd "$_archive"
	luarocks --lua-version=5.1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
