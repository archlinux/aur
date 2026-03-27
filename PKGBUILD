# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
_pkg=google-cloud-testutils
pkgver=1.7.1
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-testutils"
license=('Apache-2.0')
depends=('python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-python/archive/$_pkg-v$pkgver.tar.gz")
sha256sums=('d3d6878eaf27b8bbe015e24e239a6c5dc34ccc4902ad5bd585483e170334b7ce')

build() {
	cd "google-cloud-python-$_pkg-v$pkgver/packages/$_pkg"
	python -m build --wheel --no-isolation
}

## tests require nox
# check() {
# 	cd "$_name-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "google-cloud-python-$_pkg-v$pkgver/packages/$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
