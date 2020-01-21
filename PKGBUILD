# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase=python-tenableio
_pyname=Tenable.io-SDK-for-Python
pkgname=('python-tenableio' 'python2-tenableio')
makedepends=('python-setuptools' 'python2-setuptools')
pkgver=1.13.0
pkgrel=1
pkgdesc="Python library to easily integrate with the tenable.io API"
arch=('any')
url="https://github.com/tenable/Tenable.io-SDK-for-Python/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/Tenable.io-SDK-for-Python/archive/${pkgver}.tar.gz")
sha512sums=('c48fbb0097f47eca201743fcc7db12d8b36aed5b8df8e662b460dfef3b7d47ce00597a15f908702f11d00d6253da12dbd8651942f4b667e5dc585670445e6779')

prepare() {
#  mv ${_pyname}-v${pkgver} ${_pyname}-${pkgver}
  cp -a ${_pyname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-tenableio() {
  depends=('python' 'python-requests' 'python-six')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tenableio() {
  depends=('python2' 'python2-requests' 'python2-six')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
