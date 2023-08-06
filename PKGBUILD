# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=2.3.2
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
depends=('python' 'python-lockfile' 'python-setuptools')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-testtools')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5')
b2sums=('bce00867850e8451bcaf5a51864bdd751fa3b5e7be8ae1d36d724a915680713fc66c0fc6c8499bce03e0eb86465f5806fb8645376e600b8eac579fee3c24a087')

prepare() {
  cd $pkgname-$pkgver

  # NOTE: twine is *not* required for building this package
  sed -e '/twine/d' -i setup.py
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover -v
}

package_python-daemon() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
