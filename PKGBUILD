# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.12
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')

_pypi="quaternionic"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'b80922bdc47175daa207efc581a0ee19cea381439148b9ee45a774492400ef31'
)

build() {
	cd "$_pypi-$pkgver"
	python -m build --no-isolation --wheel
}

check() {
	cd "$_pypi-$pkgver/tests"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer "../dist/$_pypi-$pkgver-"*.whl
	test-env/bin/python -m pytest
}

package() {
	cd "$_pypi-$pkgver"
	python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
