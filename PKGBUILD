# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-wheel
_name=${pkgname#python2-}
pkgver=0.37.1
pkgrel=1
pkgdesc="A built-package format for Python, version for Python 2.7"
arch=(any)
url="https://github.com/pypa/wheel"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python-tox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a82516a039e521100ecdef137f9e44249bf6903f9aff7d368e84ac31d60597f5')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  tox -e py27
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  mv "$pkgdir/usr/bin/wheel" "$pkgdir/usr/bin/wheel2"
}
