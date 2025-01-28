# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.3.2
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
sha256sums=('b19856e75cbaa4a32f65eb21624daa7be0467a2f16f2ab80a704dbe4b81dae13')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
