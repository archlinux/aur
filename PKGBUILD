# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Vasquez <je-vv@e.email>

pkgname=python-pyszn
_pkg="${pkgname#python-}"
pkgver=1.6.0
pkgrel=1
pkgdesc="A Python package for the Simplified Zone Notation standard"
arch=('any')
url='https://github.com/hpenetworking/pyszn'
license=('Apache')
depends=('python-pyparsing')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-deepdiff')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3bd28b0b060fe066dc20168b89169416996a721e79d0fd0f48c239555f878635')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/lib/" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
