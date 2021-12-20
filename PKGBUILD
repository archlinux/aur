# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=ufoLib2
pkgname=python-${_pyname,,}
pkgver=0.13.0
pkgrel=1
pkgdesc='A library to deal with UFO font sources'
arch=(any)
url="https://github.com/fonttools/$_pyname"
license=(Apache)
_pydeps=(attrs
         fonttools
         fs) # for fonttools[ufo]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-dephell
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('c497efc8d13edf4060362ad7f2ed7184a703f29337a30440542e165fea85a843')

prepare() {
	cd "$_archive"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
