# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=embedders.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.2.0
_rockrel=1
pkgrel=2
pkgdesc='Graphviz, Lilypond (etc.) support for the SILE typesetting system'
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
sha256sums=('a0ff37e1d282de787dfc0a47c2b0a6af3d1f49f713d8095331960ed786cb6a32')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
