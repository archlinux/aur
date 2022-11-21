# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=pytest-qt
pkgname=python38-pytest-qt
pkgver=4.2.0
pkgrel=1
pkgdesc='pytest support for PyQt and PySide applications'
arch=(any)
license=('MIT')
url='https://github.com/pytest-dev/pytest-qt'
depends=('python38-pytest')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pyqt5' 'pyside2' 'xorg-server-xvfb')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('57e175bada0e33101eeb7d85579f6e804658d74168714b117b3a1ba564826405e70860b258caf28c917ddca7acd1842de2133a55b342862762fc37ca1a758b69')

build() {
  cd ${_name}-$pkgver
  python3.8 setup.py build
}

check() {
  cd ${_name}-$pkgver/src
  PYTHONPATH=. PYTEST_QT_API=pyqt5 xvfb-run pytest --fixtures pytestqt ../tests
}

package() {
  cd ${_name}-$pkgver
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
