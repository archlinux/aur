# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools-CLI
pkgname=ftcli
pkgver=1.1.9
pkgrel=1
pkgdesc='Foundry Tools command line font editor'
arch=(any)
url="https://github.com/ftCLI/$_upname"
license=(MIT)
_py_deps=(cffsubr
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
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('993138e4d8efe441c8bfd35b97101e387205b1e34e6cef4ecbfa17ae61866b18')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
