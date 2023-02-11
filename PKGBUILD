# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.6
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')

_pypi="quaternionic"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '870e499f9d0f5881a2583abba95309f809879f29ec94990383ade25df073eaf8'
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
