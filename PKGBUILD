# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=ptable.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=3.1.1
_rockrel=1
pkgrel=1
pkgdesc='Paragraph boxes, framed boxes and table packages for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c5d56c5ffbf6950634bb71806bce5e0c18fbf45f2c9cc109dca2f736ac290b51')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
