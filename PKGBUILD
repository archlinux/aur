# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools-CLI
pkgname=ftcli
pkgver=1.1.18
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
sha256sums=('8fe6135f3bafd9292382cc59f94b5a24f478d8d446468ceb2d782b4e59c977a2')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
