# Maintainer: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>

_name=transonic
pkgname=python-${_name}
pkgver=0.4.11
pkgrel=1
pkgdesc="AOT / JIT compiler frontend for modern Python-Numpy code"
arch=('any')
url="https://${_name}.readthedocs.io"
license=('BSD')
depends=(
  'autopep8' 'python' 'python-setuptools' 'python-astunparse' 'python-beniget'
  'python-gast' 'python-numpy'
)
optdepends=(
  'python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=(${_name})

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('257bd1abf3deff71a7fd1c5200c9d55f3ebd7fcc6df8454a49d96b9152818638')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
