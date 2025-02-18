# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.15
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

source=(
  "git+https://github.com/moble/quaternionic.git#tag=v$pkgver"
)
sha256sums=(
  '6b9af255918c4bc08af7b16fd7207a2eac4bf5a2dc2d56ebbd7f81ef604ebce7'
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
