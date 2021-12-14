# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=cu2qu
pkgname=python-$_pyname
pkgver=1.6.7.post1
pkgrel=2
pkgdesc='Cubic-to-quadratic bezier curve conversion'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(defcon
         fonttools
         fs)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(cython
             python-setuptools-scm)
checkdepends=(python-coverage
              python-pytest-runner)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('8c982f11de0151f41da83df4a4f75207380301c0356fb7a3322f0db74e16e6f4')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

