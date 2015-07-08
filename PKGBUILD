# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge-docs
pkgver=1.0.3
pkgrel=1
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=()
makedepends=('python2-sphinx')
source=(http://pypi.python.org/packages/source/f/fudge/fudge-$pkgver.tar.gz)
md5sums=('ee0797e0a28732e630938da16137240a')

build() {
  cd "$srcdir/fudge-$pkgver"
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cd docs
  # python-sphinx (Sphinx for Python 3) tries to import Fudge before
  # running 2to3 fixers. Instead, use python2-sphinx to correctly
  # import the unfixed code.
  make html SPHINXBUILD=sphinx-build2
  mkdir -p "$pkgdir/usr/share/doc/python-fudge/"
  cp -a _build/html "$pkgdir/usr/share/doc/python-fudge/"
}


