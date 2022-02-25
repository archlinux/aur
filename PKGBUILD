# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Olivier Biesmans <o.aurlinux@biesmans.fr>

pkgname=python-tellcore-py
pkgver=1.1.3
pkgrel=2
pkgdesc="Python wrapper for Telldus' home automation library."
arch=('any')
url='https://github.com/erijo/tellcore-py'
license=('GPL3')
depends=('python')
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tellcore-py/tellcore-py-$pkgver.tar.gz")
sha256sums=('403d8e9d4f8ad95bda4c681f4d897c7633b48d25ee85b5bf39f30a362a49b122')

build() {
  cd "tellcore-py-$pkgver"
  python -m build --wheel --no-isolation
  cd docs
  make man
}

check() {
  cd "tellcore-py-$pkgver"
  python run_tests
}

package() {
  export PYTHONHASHSEED=0
  cd "tellcore-py-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/tellcore-py.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
