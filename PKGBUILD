# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-yep-git
pkgver=0.1.r14.gfd22ac9
pkgrel=1
pkgdesc='Profile compiled code (C/C++/Fortran) from the Python interpreter.'
arch=('any')
url='http://pypi.python.org/pypi/yep/'
license=('BSD')
depends=('gperftools' 'python')
source=('git://github.com/fabianp/yep.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/yep"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/yep"
  python setup.py build
  sed -n '/License, (C)/p' README.rst > LICENSE
}

package() {
  cd "$srcdir/yep"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

