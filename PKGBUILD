# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.8.0
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
sha256sums=('8e55b6efb2a168e41f130b152f64ed19a667218a8d6488bcc5626e86ef7d6d48')

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
