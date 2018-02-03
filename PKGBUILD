# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=termstyle
pkgbase='python-termstyle'
pkgname=('python-termstyle' 'python2-termstyle')
pkgver=0.1.11
pkgrel=2
pkgdesc="Console colouring for Python"
arch=('any')
url="https://pypi.python.org/pypi/termstyle"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/65/53/4dfdfe12b499f375cc78caca9cf146c01e752bab7713de4510d35e3da306/termstyle-0.1.11.tar.gz)
sha256sums=('ef74b83698ea014112040cf32b1a093c1ab3d91c4dd18ecc03ec178fd99c9f9f')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-termstyle() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-termstyle() {
  depends=('python')
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
