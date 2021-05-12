# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=bitvector-for-humans
pkgname=python-${_pkgname}
pkgver=0.14.1
pkgrel=1
pkgdesc='A simple pure python Bit Vector class for Humans'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/bitvector'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2a3178a0cf73638e09e8b9a3191f797d80ad283c975f4daef3b34dffbac98b92')

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
