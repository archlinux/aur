# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
_pkg=python-test-utils
pkgver=1.7.0
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/python-test-utils"
license=('Apache-2.0')
depends=('python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e6be40b1fe2509bdbd370e7f44d5a618acff34181248208583ac862fcbf67fa8')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## tests require nox
# check() {
# 	cd "$_name-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
