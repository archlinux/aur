# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase=python-tenableio
_pyname=Tenable.io-SDK-for-Python
pkgname=('python-tenableio' 'python2-tenableio')
makedepends=('python-setuptools' 'python2-setuptools')
pkgver=1.13.1
pkgrel=1
pkgdesc="Python library to easily integrate with the tenable.io API"
arch=('any')
url="https://github.com/tenable/Tenable.io-SDK-for-Python/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/Tenable.io-SDK-for-Python/archive/v${pkgver}.tar.gz")
sha512sums=('7cebfccc1759c6671aaf76543bb385e51e3eadff810446880bfaf2d4f590cf7fa4e917496753f5760546a5ca0b0ffccf195a65b2b303430c165c97c28207227c')

prepare() {
  #mv ${_pyname}-v${pkgver} ${_pyname}-${pkgver}
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
