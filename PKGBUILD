# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge-docs
pkgver=1.1.0
pkgrel=1
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=()
makedepends=('python2-sphinx')
source=(http://pypi.python.org/packages/source/f/fudge/fudge-$pkgver.tar.gz)
md5sums=('2e10ff35c998bf4bce8c5a986c5181bd')

build() {
  cd "$srcdir/fudge-$pkgver/docs"
  make html SPHINXBUILD=sphinx-build2
}

package() {
  cd "$srcdir/fudge-$pkgver"
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  # python-sphinx (Sphinx for Python 3) tries to import Fudge before
  # running 2to3 fixers. Instead, use python2-sphinx to correctly
  # import the unfixed code.
  mkdir -p "$pkgdir/usr/share/doc/python-fudge/"
  cp -a docs/_build/html "$pkgdir/usr/share/doc/python-fudge/"
}


