# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
pkgname='python2-funcsigs'
_name="${pkgname#python2-}"
pkgver=1.0.2
pkgrel=4
pkgdesc='Python function signatures from PEP362'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-unittest2')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Skip README doctests (invalid syntax in Python 2.x)
  sed -i 's-^.*readme-#&-I' tests/test_funcsigs.py
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m unittest2
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
