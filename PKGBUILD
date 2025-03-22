# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=highlighter.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.2.1
_rockrel=1
pkgrel=1
pkgdesc='A code syntax higlighting package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(labelrefs)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3365de469edef3969decb1bb3e0597ca1a144af76428fc6f79dadb98ba60431b')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
