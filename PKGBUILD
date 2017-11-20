# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-goodtests
_realName=GoodTests
pkgver=2.2.0
pkgrel=1
pkgdesc="A fast, parallel, featured python unit-testing framework (python2 version)"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/GoodTests"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/GoodTests/archive/${pkgver}.tar.gz")
sha512sums=("1698d96cb2807a344540216057b3a6e76aa06ce8622f2d72dd06229740678dad364b0ab579fb2cc7ed96ba1670aa0c5dc0d6e51bf494ecff77cd3f37183171d9")

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
