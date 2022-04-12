# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=python-tablign
pkgver=0.3.4
pkgrel=1
pkgdesc="Aligns columns in your ASCII tables"
arch=('any')
url="https://github.com/nschloe/tablign"
license=('GPL3')
depends=('python')
optdepends=('python-importlib-metadata: REQUIRED for python<3.8')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
# source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tablign/tablign-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e2631bbea1cd56939d744e57661fa765cbb35c9129737f196ce3325458867ef9')

build() {
	cd "tablign-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "tablign-$pkgver"
	PYTHONPATH=src/ pytest -x
}

package() {
	cd "tablign-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
