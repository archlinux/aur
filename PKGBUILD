# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=bitvector-for-humans
pkgname=python-${_pkgname}
pkgver=0.14.0
pkgrel=1
pkgdesc='A simple pure python Bit Vector class for Humans'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/bitvector'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3e23412605199dd7621a453033780983536bc9280d3fa0aae498dd371101c0af')

build() {
  cd "${srcdir}/bitvector-${pkgver}/bitvector"
  POETRY_CACHE_DIR=${srcdir}/poetry-cache poetry build -f sdist

  cd "${srcdir}/bitvector-${pkgver}"
  tar xf dist/${_pkgname}-${pkgver}.tar.gz

  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/bitvector-${pkgver}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
