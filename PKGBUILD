# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.7.5
pkgrel=1
pkgdesc="Official Python 3 client library for VirusTotal's REST API"
arch=('any')
url="https://github.com/virustotal/vt-py"
license=('Apache')
depends=('python-aiohttp')
makedepends=('python-pytest-runner' 'python-setuptools')
checkdepends=('python-pytest-httpserver' 'python-pytest-asyncio')
provides=('python-virustotal')
replaces=('python-virustotal-api')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ec2b5702ffeb032f724bd2c0525967c334debb4aff4d625b77a76623ead48cc3')

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
