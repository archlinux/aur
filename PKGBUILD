# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=codecov
pkgbase='python-codecov'
pkgname=('python-codecov' 'python2-codecov')
pkgver=2.0.14
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
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/cc/03/c327fbcd736de126e4f2d1eab7a70d0bf9df8089042946fedd652d000239/codecov-2.0.14.tar.gz)
sha256sums=('ba77d1438683daeae122962776c38fb88c5dc9b12dd0b40b3d1a98fef8219727')

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
