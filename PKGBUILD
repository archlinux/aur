# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pyensembl
pkgbase='python-pyensembl'
pkgname=('python-pyensembl' 'python2-pyensembl')
pkgver=1.1.0
pkgrel=3
pkgdesc="Python interface to ensembl reference genome metadata"
arch=('any')
url="https://pypi.python.org/pypi/pyensembl"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/23/2f/398e41dfcaf1ddd4c349f9006de2397e23044c7c9c543840f239af6390e4/pyensembl-1.1.0.tar.gz)
sha256sums=('fe6512f86e29538c22f518828c9cf745ba97ca895dfbf3dfe6a6acdf31f9b5f6')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pyensembl() {
  depends=(
    'python2'
    'python2-datacache'
    'python2-gtfparse'
    'python2-memoized-property'
    'python2-numpy'
    'python2-pandas'
    'python2-serializable'
    'python2-six'
    'python2-tinytimer'
    'python2-typechecks')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  mv "${pkgdir}"/usr/bin/"${_name}" "${pkgdir}"/usr/bin/"${_name}"2
}

package_python-pyensembl() {
  depends=(
    'python'
    'python-datacache'
    'python-gtfparse'
    'python-memoized-property'
    'python-numpy'
    'python-pandas'
    'python-serializable'
    'python-six'
    'python-tinytimer'
    'python-typechecks')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  sed -i 's/python2/python/g' "${pkgdir}"/usr/bin/"${_name}"
}
