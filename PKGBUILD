# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-pysondb')
pkgver=1.7.0
pkgrel=1
pkgdesc="JSON-based database for Python"
arch=('any')
url='https://github.com/pysonDB/pysonDB'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-filelock' 'python-beautifultable')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf0f6e91f06e0c9e892eb64b6ace9d716beb9b81d49ae529f7866d312a65644a')

prepare() {
  cd "$srcdir/pysonDB-$pkgver"

  # Don't install the "tests" package
  sed -ri 's/(packages = )find:/\1pysondb/' setup.cfg
}

package() {
  cd "$srcdir/pysonDB-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
