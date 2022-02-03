# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-googlemaps
pkgver=4.6.0
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
arch=('any')
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd70fc848940cc3db652f20557de31feeb966065c6d1ca9c8967470867119ff6')

build() {
	cd "google-maps-services-python-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "google-maps-services-python-$pkgver"
	pytest -x -c /dev/null
}

package() {
	export PYTHONHASHSEED=0
	cd "google-maps-services-python-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
