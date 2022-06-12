# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-py
_name=${pkgname#python2-}
pkgver=1.11.0
pkgrel=1
pkgdesc='I/O facilities including logging, local/SVN paths, INI parsing, '`
       `'API control, lazy importing and Python code generation/introspection'
arch=('any')
url='https://github.com/pytest-dev/py'
license=('MIT')
depends=('python2')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('73845c6278da21cebd41d90e363da84aa93e9dd3485d00f7ced540fedbd41054')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
