# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
pkgver=1.3.0
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/python-test-utils"
license=('Apache')
depends=('python>=3.6' 'python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('862f737bcdd57a61fd11a70d9b9cfd9a4426b0357cefcaef326f494d4f0b01af'
            'b1b21b2a0e329f38914b07c1184f8a2dede39599a540ee89125d42a7dfaae533')

prepare() {
	patch -p1 -d "python-test-utils-$pkgver" < 001-setup.py.patch
}

build() {
	cd "python-test-utils-$pkgver"
	python setup.py build
}

## tests require nox
# check() {
# 	cd "$_name-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "python-test-utils-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
