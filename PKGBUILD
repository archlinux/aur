# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-genty
pkgver=1.3.2
pkgrel=14
pkgdesc="Allows you to run a test with multiple data sets"
arch=('any')
license=('Apache-2.0')
url="https://github.com/box/genty"
depends=('python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("git+https://github.com/box/genty.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cd "$srcdir/genty"
  sed -i 's/from mock/from unittest.mock/' test/test_genty.py
}

build() {
  cd "$srcdir/genty"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/genty"
  python -m unittest -v
}

package() {
  cd genty
  python -m installer --destdir="$pkgdir" dist/*.whl
}
