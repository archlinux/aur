# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=cu2qu
pkgname=python-$_pyname
pkgver=1.6.7
pkgrel=3
pkgdesc='Cubic-to-quadratic bezier curve conversion'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_py_deps=(defcon
          fonttools
          fs)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(cython
             python-setuptools-scm)
checkdepends=(python-coverage
              python-pytest-runner)
#source=("$_pyname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('559e962539c27a2964e7a2693c7053eacdabf771f0103e83baaadfa567bd8139')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pyname-$pkgver"
	python setup.py test
}

package() {
	cd "$_pyname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

