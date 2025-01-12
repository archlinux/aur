# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=python-cargo2rpm
pkgver=0.1.18
pkgrel=1
pkgdesc="Translation layer between cargo and RPM"
arch=('any')
url="https://pagure.io/fedora-rust/cargo2rpm"
license=('MIT')
depends=('python' 'rust')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy')
source=("https://pagure.io/fedora-rust/cargo2rpm/archive/$pkgver/cargo2rpm-$pkgver.tar.gz")
sha256sums=('c295d6798db9f8ca080f6726e278cc2a80a2ff90e22a4bb820d767409fe4e86c')

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
