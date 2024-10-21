# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=find_libpython
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=2
pkgdesc="Finds the libpython associated with the current Python environment, wherever it may be hiding"
arch=(any)
url="https://github.com/ktbarrett/find_libpython"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
options=(!emptydirs)
install=
source=("https://github.com/ktbarrett/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a1457f5d80040502a6aa5090e0b8b24d5f2f990f1c12bef693fb36832c13a5c753292891f28e9de90d54b550af299b05b9af54c2985cd6b274d6207a87750604')

prepare() {
	echo "Version: $pkgver" > "$_pkgname-$pkgver/PKG-INFO"
}

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
