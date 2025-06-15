# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='pymunk'
pkgname=python-${_name}
pkgver=7.0.1
pkgrel=2
pkgdesc="Pymunk is a easy-to-use pythonic 2D physics library."
arch=('any')
url='http://www.pymunk.org/'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('96a38e8123f4d89f8820b43640f1f623d6844f1f97eea09c4660f031780a9ff8')
depends=('python' 'python-cffi')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-cffi' 'cmake' 'gcc')
checkdepends=('python-pygame')
optdepends=('python-pyglet' 'python-pygame' 'python-aafigure' 'python-matplotlib' 'python-numpy')

build() {
	cd "$srcdir"/${_name}-$pkgver
	python -m build --wheel --no-isolation
}


check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "${srcdir}"/${_name}-${pkgver}/build/lib.linux-$CARCH-cpython-$python_version
  python -m pymunk.tests
}

package() {
	cd "$srcdir"/${_name}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
