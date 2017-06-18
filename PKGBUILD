# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-goodtests
_realName=GoodTests
pkgver=2.1.1
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework (python2 version)"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("1c3fa63318d4395b7ab85d3a3c87ba34d1f3dab9d3854af4984074e14673c3b82d39a4d632ac46d1f36c136b835b05797a96a4f801f4b87f607ed1c5122c4af7")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mv "${pkgdir}/usr/bin/GoodTests.py" "${pkgdir}/usr/bin/GoodTests2.py"

  mkdir -p "${pkgdir}/usr/share/GoodTests2.py"
  install -m 755 distrib/runTests.py "${pkgdir}/usr/share/GoodTests2.py"

  sed 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' -i "${pkgdir}/usr/share/GoodTests2.py/runTests.py"
}
