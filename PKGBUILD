# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Orru <andrea at orru dot io>
# Contributor: Andrew Rabert <ar at nullsum dot net>

pkgname=python-undervolt
_pkg="${pkgname#python-}"
pkgver=0.3.0
pkgrel=2
pkgdesc="Undervolt Intel CPUs under Linux"
arch=('any')
url="https://github.com/georgewhewell/undervolt"
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('undervolt')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('ae8d49526ecb68acc15faac860404f6692208b540a0b33781d96396cac862767')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
