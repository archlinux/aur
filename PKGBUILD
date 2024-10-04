# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=textsubsuper.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.2.0
_rockrel=1
pkgrel=2
pkgdesc='Real or fake superscripts and subscripts for the SILE typesetting system'
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
sha256sums=('9a3fce68c1d8174f9cb1d26851cbfe8b2bd8d2de2849b9e05022a0bcc8d7b5f5')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
