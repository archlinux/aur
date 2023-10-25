# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=python-cargo2rpm
pkgver=0.1.12
pkgrel=1
pkgdesc="Translation layer between cargo and RPM"
arch=('any')
url="https://pagure.io/fedora-rust/cargo2rpm"
license=('MIT')
depends=('python' 'rust')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy')
source=("https://pagure.io/fedora-rust/cargo2rpm/archive/$pkgver/cargo2rpm-$pkgver.tar.gz")
sha256sums=('1b07775dd8e180539d3242148e9b8e63c8efbfd6a9cac67a38402be9d6a240d3')

build() {
	cd cargo2rpm-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd cargo2rpm-$pkgver
	PYTHONPATH=. pytest
}

package() {
	cd cargo2rpm-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
