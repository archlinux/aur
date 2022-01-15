# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.6.0
pkgrel=1
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
makedepends=(python-setuptools)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('dd8fd669072b7c6506fba96b0121611050db6568f99b14b9581b895931bd5d28')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
