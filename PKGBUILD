# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=yep
pkgname=python-$_pyname
pkgver=0.4
pkgrel=1
pkgdesc='A module for profiling compiled extensions'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('gperftools' 'python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('b78a9232a296bbd416c038d1b588dff6')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
  sed -n '/License, (C)/p' README.rst > LICENSE
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
