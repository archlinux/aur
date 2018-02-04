# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=typechecks
pkgbase='python-typechecks'
pkgname=('python-typechecks' 'python2-typechecks')
pkgver=0.0.2
pkgrel=2
pkgdesc="Helper functions for runtime type checking in Python"
arch=('any')
url="https://pypi.python.org/pypi/typechecks"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/60/8e/ca9aac318aeb8e909b4435881c79a633ed40e4efa6fbb3c32c393b5da512/typechecks-0.0.2.tar.gz)
sha256sums=('1473dfecd9ceebb3608df3515cadd09bf87ca8385ae66839943bd373a6b9da36')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-typechecks() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-typechecks() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
