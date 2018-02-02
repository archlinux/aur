# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=codecov
pkgbase='python-codecov'
pkgname=('python-codecov' 'python2-codecov')
pkgver=2.0.15
pkgrel=1
pkgdesc="Hosted coverage reports for Github, Bitbucket and Gitlab"
arch=('any')
url="https://pypi.python.org/pypi/codecov"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
checkdepends=('python-unittest2')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/77/f2/9790ee0f04eb0571841aff5ba1709c7869e82aa2145a04a3d4770807ff50/codecov-2.0.15.tar.gz)
sha256sums=('8ed8b7c6791010d359baed66f84f061bba5bd41174bf324c31311e8737602788')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-codecov() {
  depends=('python2' 'python2-requests' 'python2-coverage')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-codecov() {
  depends=('python' 'python-requests' 'python-coverage')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
