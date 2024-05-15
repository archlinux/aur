# Contributor: David Runge <dvzrv@archlinux.org>
pkgname=python2-pytest-rerunfailures
# Do NOT update this further. Version 9.0 dropped support for Python 2.
pkgver=8.0
pkgrel=1
pkgdesc='A plugin for py.test that re-runs failed tests to eliminate intermittent failures (Legacy Python 2 version)'
arch=('any')
url='https://github.com/pytest-dev/pytest-rerunfailures/'
license=('MPL2')
depends=('python2-pytest')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-mock')
source=("https://files.pythonhosted.org/packages/source/p/pytest-rerunfailures/pytest-rerunfailures-${pkgver}.tar.gz")
sha512sums=('538fe5ca579ec50fc1689c4b7df3a55e0bdb08f87c2dfeb219ee141ef67c6c74a324c64f183f3ff85a5289ecfb54beef0fde2105eb0ae888ed861a15194a9dc5')

build() {
  cd "pytest-rerunfailures-${pkgver}"
  python2 setup.py build
}

check() {
  cd "pytest-rerunfailures-${pkgver}"
  py.test2 test_pytest_rerunfailures.py
}

package() {
  cd "pytest-rerunfailures-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 {CHANGES.rst,README.rst}
}
