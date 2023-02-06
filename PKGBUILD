# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=python-tablign
_pkg="${pkgname#python-}"
pkgver=0.3.7
pkgrel=1
pkgdesc="Aligns columns in your ASCII tables"
arch=('any')
url="https://github.com/nschloe/tablign"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ad958978b2daaf7d08e23f0cd3cff1496f48dc64147521c1c3f71915c617444')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=src/ pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
