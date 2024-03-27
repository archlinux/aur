# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=markdown.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.0
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
sha256sums=('f2cff13cc7c72f51eaad3e0b304a2bc5b489402cc1f852ca3d6518d6a0fe65b6')

package() {
	cd "$_archive"
	luarocks --lua-version=5.1 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
