# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=1.0.9
pkgrel=1
pkgdesc='Pytest plugin that allows multiple failures per test'
arch=('any')
url='https://github.com/okken/pytest-check'
license=('MIT')
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-flit-core'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('058bb17255f08b83e0fc9f6c91be99b2a17676eae903f70999598c1ee69cf0b89cbe3767bbc3fabbacb2a5db35d26ed825599f401f693f4dc6195c02fac5c923')
b2sums=('8bbf0299e76a0e5acbb6ab4e8ce2bcb386ad2e1e91e1596e317bed9800b03c0fcadf76abe76a0ab9d2d8d190dbd839e042579abb08ea898b8325c27898670088')

prepare() {
  cd "$_pkgname-$pkgver"

  # remove flit-core version constraint
  sed \
    -i pyproject.toml \
    -e 's/,<3//'
}

build() {
  cd "$_pkgname-$pkgver"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
