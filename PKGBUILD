# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=python-cargo2rpm
pkgver=0.1.14
pkgrel=1
pkgdesc="Translation layer between cargo and RPM"
arch=('any')
url="https://pagure.io/fedora-rust/cargo2rpm"
license=('MIT')
depends=('python' 'rust')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy')
source=("https://pagure.io/fedora-rust/cargo2rpm/archive/$pkgver/cargo2rpm-$pkgver.tar.gz")
sha256sums=('d0b5357856cf87af40ccff970b95c2f37dd12a04bab70e3385d4ffa627a27795')

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
