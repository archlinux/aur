# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.13.1
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=('any')
url="https://github.com/virustotal/vt-py"
license=('Apache')
depends=('python-aiohttp')
makedepends=('python-pytest-runner' 'python-setuptools')
checkdepends=('python-pytest-httpserver' 'python-pytest-asyncio')
provides=('python-virustotal')
replaces=('python-virustotal-api')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cc106d33727c89c82577711f9e5cb625de72cde4f7a4370a3603b2d4d8dbe727')

build() {
	cd "vt-py-$pkgver"
	python setup.py build
}

check() {
	cd "vt-py-$pkgver"
	python setup.py pytest
}

package() {
	export PYTHONHASHSEED=0
	cd "vt-py-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
