# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.7.6
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
sha256sums=('750bf4bb63adfbacb35234afa49f76c007bbde836d289297913d99e013c8aba8')

build() {
	cd "vt-py-$pkgver"
	python setup.py build
}

check() {
	cd "vt-py-$pkgver"
	python setup.py pytest
}

package() {
	cd "vt-py-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
