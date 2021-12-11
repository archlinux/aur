# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vt-py
pkgver=0.11.0
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('10e33ed5297f1ea686133d8afde954af53a34ca19926169df9fdcfa1e51707a7')

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
