# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.9.10
pkgrel=2
pkgdesc='A command line font editor'
arch=(any)
url="https://github.com/$_upname/$_upname"
license=(MIT)
_py_deps=(colorama
          click
          brotli
          fonttools
          skia-pathops
          zopfli)
depends=(dehinter
         font-line
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('58a29f809a6d788270d4f1c025feaa12d8fcfa0de01626edbd690106eaf9ba71')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
