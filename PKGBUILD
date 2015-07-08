# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Erol V. Aktay <e.aktay@gmail.com>
pkgname=python-geniusql-svn
# revision (23.8.2007)
pkgver=r329
pkgrel=1
pkgdesc="A thread-safe low-level object-relational mapper for python"
arch=('any')
url="http://www.aminus.net/geniusql/"
license=('Public Domain')
depends=('python2')
makedepends=('subversion' 'python2-setuptools')
source=('geniusql::svn+http://svn.aminus.net/geniusql/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/geniusql"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/geniusql"
  python2 setup.py build
}

package() {
  cd "$srcdir/geniusql"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -m 755 -d "$pkgdir/usr/share/doc/"
  mv build/lib/geniusql/doc/ "$pkgdir/usr/share/doc/geniusql"
  install -Dm 644 geniusql/license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

