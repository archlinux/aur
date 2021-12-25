# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.5.5
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
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5207a76ff3e02936e50fdcb81b8b2c84ab9d67ab2adaa3c209115bdae1ebbe0a')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
