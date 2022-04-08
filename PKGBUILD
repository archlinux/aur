# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pytest-filedata
pkgver=0.4.0
pkgrel=2
pkgdesc="Easily load test data from files"
arch=('any')
url="https://github.com/20c/pytest-filedata"
license=('Apache')
depends=('python-decorator' 'python-future' 'python-requests-mock')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=()
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7c3cc9280df9f2015d9671d517884781ba75871c4775ae77863da8d8937fd127')

build() {
	cd "pytest-filedata-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pytest-filedata-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "pytest-filedata-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
