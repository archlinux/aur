# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-googlemaps
pkgver=4.5.3
pkgrel=1
pkgdesc="Python client library for Google Maps Platform"
url="https://github.com/googlemaps/google-maps-services-python"
arch=('any')
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-responses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8574de885d5d7632a3a75e3c391de1ecddb9b56154582ea3e84b1a2c2b1ccd89')

build() {
	cd "google-maps-services-python-$pkgver"
	python setup.py build
}

check() {
	cd "google-maps-services-python-$pkgver"
	pytest -c /dev/null
}

package() {
	cd "google-maps-services-python-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
