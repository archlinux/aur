# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-goodtests
_realName=GoodTests
pkgver=3.0.1
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework (python2 version)"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("c0342ffc951118b8c8e5115b49d1c8c3c26ba06fbe930c5c4e6935bb3e37d162b35355429d4e11dd97f49cac6d6fb7b4618b593f87b31c0b2101237649429e88")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mv "${pkgdir}/usr/bin/GoodTests.py" "${pkgdir}/usr/bin/GoodTests2.py"

  mkdir -p "${pkgdir}/usr/share/GoodTests2"
  install -m 755 distrib/runTests.py "${pkgdir}/usr/share/GoodTests2/runTests.py"

  sed 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' -i "${pkgdir}/usr/share/GoodTests2/runTests.py"
}
