# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=logzero
pkgbase='python-logzero'
pkgname=('python-logzero' 'python2-logzero')
pkgver=1.3.1
pkgrel=2
pkgdesc="Robust and effective logging for Python 2 and 3"
arch=('any')
url="https://pypi.python.org/pypi/logzero"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/06/84/8b9b78e9a639bbad42e52e312925cd55c36a7d80d8e14638b1a29c35bf08/logzero-1.3.1.tar.gz)
sha256sums=('f3433f87a184e1d846099c521437bfe9d463d4b74c3b2da3488b4f52ce821a1d')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-logzero() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-logzero() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
