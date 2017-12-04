# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-goodtests
_realName=GoodTests
pkgver=3.0.0
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework (python2 version)"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("afa466ef702d42fcbb675fa8af6b72e99289eaf77994df995aeee43af23aacfa2831c9a6dfcfaa16fca260d423beee49f5818f8c703cc515952b1bc20f4c1fe9")

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
