# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.8
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')

_pypi="quaternionic"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '8301d3b15842ebd24f0415f1da0bf32774b2b9357e4db7e8a9ee01e170dc7700'
)

build() {
	cd "$_pypi-$pkgver"
	python -m build --no-isolation --wheel
}

package() {
	cd "$_pypi-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
