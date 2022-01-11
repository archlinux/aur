# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-babelfont
_pyname=${pkgname#python-}
pkgver=2.0.2
pkgrel=3
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_py_deps=(defcon
          fontparts
          fonttools)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('4fe45910e0260f17045c6860a0e04c387af95fb795ad180131c7b33f6a3db40a')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
