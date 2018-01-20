# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=datacache
pkgbase='python-datacache'
pkgname=('python-datacache' 'python2-datacache')
pkgver=0.4.20
pkgrel=2
pkgdesc="Python helpers for transparently downloading datasets"
arch=('any')
url="https://pypi.python.org/pypi/datacache"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".zip::https://pypi.python.org/packages/b6/d9/81d3eb73746ee94e4acd054bae9466f94c4edeb1d3f4357dc6a1d066db6e/datacache-0.4.20.tar.gz)
sha256sums=('ad644a605dd1c1f054f7f68d67ee5102ed0461cf612870600f59e7020a254044')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-datacache() {
  depends=(
    'python2'
    'python2-appdirs'
    'python2-biopython'
    'python2-mock'
    'python2-pandas'
    'python2-progressbar33'
    'python2-requests'
    'python2-typechecks')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-datacache() {
  depends=(
    'python'
    'python-appdirs'
    'python-biopython'
    'python-mock'
    'python-pandas'
    'python-progressbar33'
    'python-requests'
    'python-typechecks')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
