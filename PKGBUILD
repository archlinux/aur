# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase=python-tenableio
_pyname=Tenable.io-SDK-for-Python
pkgname=('python-tenableio' 'python2-tenableio')
makedepends=('python-setuptools' 'python2-setuptools')
pkgver=1.10.0
pkgrel=1
pkgdesc="Python library to easily integrate with the tenable.io API"
arch=('any')
url="https://github.com/tenable/Tenable.io-SDK-for-Python/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/Tenable.io-SDK-for-Python/archive/v${pkgver}.tar.gz")
sha512sums=('a3f459e76b0d159c94a486f2f77d59d7355b409d01984ab629a0755bffa6f556dab996cd0b3cb982b8b874fa463281b96933e3da98c986eb9fee845c207da909')

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
