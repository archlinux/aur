# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.5.2
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
sha256sums=('f6e467e8b88a10c023ab24aa129cf433daca9f679c955eb4f0f5cd1c9daad785')

package() {
	cd "$_archive"
	luarocks --lua-version=5.1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
