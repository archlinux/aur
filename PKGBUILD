# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-raccoon
pkgver=3.2.1
pkgrel=1
pkgdesc="Python DataFrame with fast insert and appends"
url="https://raccoon.readthedocs.io"
arch=('any')
license=('MIT')

depends=(
  'python-tabulate'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pypi='raccoon'
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '4a3be5ebb371eda031eeb26680b09ef59fa5c310f568aa2aadea2a3c2d4faf6e'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst
}
