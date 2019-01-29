# $Id$
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pypy-pyparsing
pkgname=('pypy-pyparsing' 'pypy3-pyparsing')
pkgver=2.3.1
pkgrel=1
pkgdesc='General parsing module for Python'
arch=('any')
url='http://pyparsing.wikispaces.com/'
makedepends=('pypy-setuptools' 'pypy3-setuptools' 'subversion')
license=('MIT')
source=("https://github.com/pyparsing/pyparsing/archive/pyparsing_$pkgver.tar.gz")
sha512sums=('8c0e2c7a7dc7ec12f3e7c260bde25a33f325af89d9bc2329b7882ebd8a3f506fb06a36fdaba0fd8ed48040d5b7fc5288c41b01f2df84459a9980a035cb213dd0')

build() {
  cd pyparsing-pyparsing_$pkgver
  pypy setup.py build
  pypy3 setup.py build
}

check() {
  cd pyparsing-pyparsing_$pkgver
  pypy unitTests.py
  pypy3 unitTests.py
}

package_pypy3-pyparsing() {
  depends=('pypy3')

  cd pyparsing-pyparsing_$pkgver

  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_pypy-pyparsing() {
  depends=('pypy')

  cd pyparsing-pyparsing_$pkgver

  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
