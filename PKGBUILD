# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.14
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')

depends=(
  'python-numba'
  'python-numpy'
  'python-scipy'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)

_pypi="quaternionic"
source=(
  "git+https://github.com/moble/quaternionic.git#tag=v$pkgver"
)
sha256sums=(
  '6c813c0a74c7e4befe5438ee54261bb41b2f105e13d3f60b471dd95f33226a5d'
)

build() {
	cd quaternionic
	python -m build --no-isolation --wheel
}

check() {
	cd quaternionic
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer "dist/quaternionic-$pkgver-"*.whl
	test-env/bin/python -m pytest
}

package() {
	cd quaternionic
	python -m installer --destdir="$pkgdir" "dist/quaternionic-$pkgver-"*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
