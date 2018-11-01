# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-goodtests
_realName=GoodTests
pkgver=3.0.4
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework (python2 version)"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("bd97181a2cc1bbbe153fe563969bc9fa6cd7b49441470207aeea3f47775c91df219e4a1a57ddfe1f9dd6c1c67d5873af4217626a21ad763bbfbeea8111c3872e")

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
