# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=serializable
pkgbase='python-serializable'
pkgname=('python-serializable' 'python2-serializable')
pkgver=0.1.1
pkgrel=2
pkgdesc="Base class with serialization helpers for user-defined Python objects"
arch=('any')
url="https://pypi.python.org/pypi/serializable"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/1a/8c/140c24214f503366c80cf9d42c474df2696ea5291bdd318c24d014a859db/serializable-0.1.1.tar.gz)
sha256sums=('87f9fadbd0fba5c7951858d16ae9109afa4c96fd486e663419f3051f352a22d9')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-serializable() {
  depends=(
    'python2'
    'python2-simplejson'
    'python2-six'
    'python2-typechecks'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-serializable() {
  depends=(
    'python'
    'python-simplejson'
    'python-six'
    'python-typechecks'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
