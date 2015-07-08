# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Jan Scevlik <jan.scevlik@gmail.com>

pkgname=python2-errorhandler
pkgver=1.1.1
pkgrel=2
pkgdesc="A logging framework handler that tracks when messages above a certain level have been logged."
arch=(any)
url="http://www.simplistix.co.uk/software/python/errorhandler"
license=(MIT)
depends=('python2')
makedepends=('python2-sphinx' 'python2-pkginfo')
source=(http://pypi.python.org/packages/source/e/errorhandler/errorhandler-$pkgver.tar.gz)
md5sums=('2d31987cb58638721b51a4f3bd17605d')

build() {
  cd "$srcdir/errorhandler-$pkgver"
  python2 setup.py build
  cd docs
  make html SPHINXBUILD=sphinx-build2
}

package() {
  cd "$srcdir/errorhandler-$pkgver"
  python2 setup.py install --root=$pkgdir
  local docs="$pkgdir/usr/share/doc/python2-errorhandler/html"
  install -dm755 "$docs"
  cp -r docs/_build/html/* "$docs"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
