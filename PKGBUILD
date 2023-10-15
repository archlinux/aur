# Maintainer: Ethan Nguyen <etnguyen03+aur AT hotmail DOT com>

pkgname=python-googlemaps
pkgver=4.10.0
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
arch=('any')
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc07f739731ba4e0a4586543ad14470695addff8f30840748b9c3b89e393aa36')

build() {
	cd "google-maps-services-python-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "google-maps-services-python-$pkgver"
	pytest -x -c /dev/null
}

package() {
	export PYTHONHASHSEED=0
	cd "google-maps-services-python-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
