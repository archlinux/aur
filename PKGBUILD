# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.2.0
_rockrel=1
pkgrel=1
pkgdesc='Native Markdown and Djot support for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(embedders
           labelrefs
           ptable
           silex
           smartquotes
           textsubsuper)
depends=(lua51-lunajson
         sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4be82e6e8971297afbd8ea2f42dee9792c493fac6dc816be52f77e7138508c16')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
