# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=python-tablign
_pkg="${pkgname#python-}"
pkgver=0.3.5
pkgrel=1
pkgdesc="Aligns columns in your ASCII tables"
arch=('any')
url="https://github.com/nschloe/tablign"
license=('GPL3')
depends=('python')
optdepends=('python-importlib-metadata: REQUIRED for python<3.8')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8274c707093c8394c3e14d09e1df5598362fc905b215fc45aaa05df653184c91')

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
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
