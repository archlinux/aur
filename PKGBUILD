# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=resilient.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=3.3.0
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
sha256sums=('096e1a552fc39a7f2cdd3f927f7182690a1ce8b4f76b08459cf6d443ba28d7aa')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
