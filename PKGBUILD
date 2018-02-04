# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=varcode
pkgbase='python-varcode'
pkgname=('python-varcode' 'python2-varcode')
pkgver=0.5.15
pkgrel=2
pkgdesc="Python library for manipulating genomic variants and predicting their effects"
arch=('any')
url="https://pypi.python.org/pypi/varcode"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/3a/f2/088d572940ebe0d1e87aee7e7a79308c8c18391124061c0d8362a56ff1e7/varcode-0.5.15.tar.gz)
sha256sums=('27b5617eaa198e3942b21ff7fd0e6eb09ff748c2a259f0ab484876dcd50291c1')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-varcode() {
  depends=(
    'python2'
    'python2-biopython'
    'python2-memoized-property'
    'python2-numpy'
    'python2-pandas'
    'python2-pyensembl'
    'python2-pyvcf'
    'python2-sercol'
    'python2-serializable'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-varcode() {
  depends=(
    'python'
    'python-biopython'
    'python-memoized-property'
    'python-numpy'
    'python-pandas'
    'python-pyensembl'
    'python-pyvcf'
    'python-sercol'
    'python-serializable'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
