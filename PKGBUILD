# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=resilient.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.2.0
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
           textsubsuper
           silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('61da3a31ea86677906d40be3580d00d177b72ac240c9c686b9be0d044d6417ad')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
