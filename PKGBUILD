# Contributor: Giacomo Vercesi <mrjackv at hotmail dot it>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
_pkg="${pkgname#python-}"
pkgver=1.1.4
pkgrel=2
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
# checkdepends=(
# 'python-pytest' 'python-pytest-runner' 'python-pytest-md-report'
# 'python-faker')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('8105ef9cf6b7d7d69fe7fd6b68a2d8f281ca9b365d7a9b670be376b2e6c81b21')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

## Cannot run tests due to circular dependencies
## python-pytest-md-report depends on this package
# check() {
#   cd "mbstrdecoder-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -D -m644 LICENSE \
  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ts=2 sw=2 et:
