# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-youseedee
_pyname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Interface to the Unicode Character Database'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(requests)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('596c1112230bdd154b6d6c962872933e16748ae8efd7cb2389b922cc9aabcab0')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
