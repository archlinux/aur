# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-fixtures
pkgver=4.0.1
pkgrel=2
pkgdesc="Fixtures, reusable state for writing clean tests and more"
arch=('any')
license=('Apache')
url="https://launchpad.net/python38-fixtures"
depends=('python38-pbr' 'python38-six' 'python38-testtools')
checkdepends=('python38-subunit')
source=("https://pypi.io/packages/source/f/fixtures/fixtures-$pkgver.tar.gz")
sha512sums=('722436f146768e4db1e3312a0db1edab2a7daa86107825fb2436654eaf74e00f569357531316df506ef3f80cef89ac7185aee1adf0b00a6ee85cbc9811ca8100')

prepare() {
  cd fixtures-$pkgver
  sed -i 's/import mock/from unittest import mock/' fixtures/tests/_fixtures/test_mockpatch.py
}

build() {
  cd fixtures-$pkgver
  python3.8 setup.py build
}

check() {
  cd fixtures-$pkgver
  python3.8 -m testtools.run fixtures.test_suite
}

package() {
  cd fixtures-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
