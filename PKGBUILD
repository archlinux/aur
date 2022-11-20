# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-genty
pkgver=1.3.2
pkgrel=11
pkgdesc="Allows you to run a test with multiple data sets"
arch=('any')
license=('Apache')
url="https://github.com/box/genty"
depends=('python38-six')
makedepends=('python38-setuptools' 'git')
source=("git+https://github.com/box/genty.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cd "$srcdir/genty"
  sed -i 's/from mock/from unittest.mock/' test/test_genty.py
}

build() {
  cd "$srcdir/genty"
  python3.8 setup.py build
}

check() {
  cd "$srcdir/genty"
  python3.8 setup.py test
}

package() {
  cd genty
  python3.8 setup.py install --root="${pkgdir}" --optimize=1
}
