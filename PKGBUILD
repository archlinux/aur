# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.5.0
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
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('64e8447de4d9643f5ba4f6dd63a67c98973e860975f35318d4cceb046a0cdc91')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
