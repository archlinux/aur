# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-unittest2
pkgver=0.5.1
pkgrel=3
pkgdesc="The new features in unittest for Python 3.2 backported to Python 3.0+"
license=("BSD")
url="http://www.voidspace.org.uk/python/articles/unittest2.shtml"
depends=("python")
makedepends=("python-distribute")
changelog=Changelog
source=(http://pypi.python.org/packages/source/u/unittest2py3k/unittest2py3k-$pkgver.tar.gz LICENSE)
arch=('any')
md5sums=('8824ff92044310d9365f90d892bf0f09'
         '0c162ecb7937c6a146e5b0457f0ccf1e')

build() {
  cd "$srcdir/unittest2py3k-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/unittest2py3k-$pkgver"
  python setup.py install "--root=$pkgdir" --optimize=1
  # Remove this when upstream adds unit2-3[.py] symlinks
  cp -a $pkgdir/usr/bin/unit2 $pkgdir/usr/bin/unit2-3
  cp -a $pkgdir/usr/bin/unit2.py $pkgdir/usr/bin/unit2-3.py

  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
