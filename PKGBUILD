# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=vmprof
pkgname=python-$_pyname
pkgver=0.2.7
pkgrel=2
pkgdesc="Python's vmprof client"
url='https://pypi.python.org/pypi/vmprof'
depends=('python-six' 'libdwarf' 'libelf' 'libunwind')
checkdepends=('python-pytest')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('2c2f9571dc4e18a581ab4474f3fbc6dd')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build_ext --inplace
  py.test tests
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
