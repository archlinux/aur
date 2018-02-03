# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=sercol
pkgbase='python-sercol'
pkgname=('python-sercol' 'python2-sercol')
pkgver=0.1.0
pkgrel=2
pkgdesc="Rich collection class with grouping and filtering helpers in Python"
arch=('any')
url="https://pypi.python.org/pypi/sercol"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/ca/6a/2e99f1b7e37f3506bfa50894ad934249d1e2c6a97e6d01d49a2fc02fd805/sercol-0.1.0.tar.gz)
sha256sums=('8579bc0031d78a4e0b8d77abcbd22c76fe4b56160f1d344717eca67b22ff9412')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-sercol() {
  depends=(
    'python2'
    'python2-serializable'
    'python2-simplejson'
    'python2-pandas'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-sercol() {
  depends=(
    'python'
    'python-serializable'
    'python-simplejson'
    'python-pandas'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
