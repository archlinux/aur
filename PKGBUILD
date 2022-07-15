# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
_pkg=python-test-utils
pkgver=1.3.3
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/python-test-utils"
license=('Apache')
depends=('python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('b24ffd9063a721472960d4991950b38269c25a291a87be5eb89657db2c1afba1'
            'b1b21b2a0e329f38914b07c1184f8a2dede39599a540ee89125d42a7dfaae533')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < 001-setup.py.patch
}

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
