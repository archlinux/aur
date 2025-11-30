# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=resilient.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=3.4.0
_rockrel=1
pkgrel=1
pkgdesc='Advanced book classes and packages for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(barcodes
           couyards
           embedders
           labelrefs
           markdown
           piecharts
           ptable
           qrcode
           textsubsuper)
conflicts=(sile-fancytoc
           sile-printoptions)
replaces=(sile-fancytoc
          sile-printoptions)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2fc6769d06b668e23024b92af823cb2af9358571f38b7bba422da55ffc310457')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
