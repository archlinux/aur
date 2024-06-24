# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools-CLI
pkgname=ftcli
pkgver=1.1.14
pkgrel=1
pkgdesc='Foundry Tools command line font editor'
arch=(any)
url="https://github.com/ftCLI/$_upname"
license=(MIT)
_pydeps=(cffsubr
         click
         brotli
         fonttools
         loguru
         pathvalidate
         rich
         skia-pathops
         zopfli)
depends=(afdko
         dehinter
         font-line
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('b41e1355e3cc410be8c67a92a07fc6081b08d6495f6dccea2f4f125d2099e338')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
