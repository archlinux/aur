# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.1.0
_rockrel=1
pkgrel=1
pkgdesc='Native Markdown and Djot support for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(embedders
           labelrefs
           ptable
           smartquotes
           textsubsuper)
depends=(sile
         "${_siledeps[@]/#/sile-}")
optdepends=('sile-silex: use with resiliant classes')
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('eaf9a0ca00bd92db1dc2723d53c27408eb185c27bb570e848c3ff704dfba9fad')

package() {
	cd "$_archive"
	luarocks --lua-version "5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
