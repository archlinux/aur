# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase=python-tenableio
_pyname=Tenable.io-SDK-for-Python
pkgname=('python-tenableio' 'python2-tenableio')
makedepends=('python-setuptools' 'python2-setuptools')
pkgver=1.11.0
pkgrel=1
pkgdesc="Python library to easily integrate with the tenable.io API"
arch=('any')
url="https://github.com/tenable/Tenable.io-SDK-for-Python/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/Tenable.io-SDK-for-Python/archive/v${pkgver}.tar.gz")
sha512sums=('4be83c7e6ca27649549f5fe87c06981b62d750a89219eda43d7a12f0ce154477ab78cb218f14c01ff6607a7d2c4005ae5c83bbcc50319631bc5d85107464a708')

prepare() {
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
