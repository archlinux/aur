# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-subunit
pkgver=1.4.0
pkgrel=5
pkgdesc="Python implementation of subunit test streaming protocol"
arch=('any')
license=('Apache')
url="https://launchpad.net/subunit"
depends=('python38-extras' 'python38-testtools')
makedepends=('python38-setuptools')
checkdepends=('python38-fixtures' 'python38-hypothesis' 'python38-testscenarios')
source=("https://pypi.io/packages/source/p/python-subunit/python-subunit-$pkgver.tar.gz")
sha512sums=('7f8ebf1cfdd7ff22bfd68367cb90dd75e7f3b5f7da71830b304225905e1799ad1ec8f0d41f5f98895c831dc10fe77229137a472b8e8e57ea84c05c66694a5b5b')

prepare() {
  sed -i 's|import unittest2 as unittest|import unittest|' python-subunit-$pkgver/python/subunit/tests/test_test_protocol.py
}

build() {
  cd python-subunit-$pkgver
  python3.8 setup.py build
}

check() {
  cd python-subunit-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python3.8 -m testtools.run subunit.test_suite || :
}

package() {
  cd python-subunit-$pkgver
  python3.8 setup.py install --root="${pkgdir}" --optimize=1
}
