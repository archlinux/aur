# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pytest-filedata
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily load test data from files"
arch=('any')
url="https://github.com/20c/pytest-filedata"
license=('Apache')
depends=('python-decorator' 'python-requests-mock' 'python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
optdepends=()
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('91a06a60b0d6e8aaeea807b6f6e940cba2b82a456d18bd49e1513dd23d2d47a9')

build() {
	cd "pytest-filedata-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pytest-filedata-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "pytest-filedata-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
