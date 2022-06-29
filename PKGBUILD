# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-serializable
_pkg="${pkgname#python-}"
pkgver=0.2.1
pkgrel=3
pkgdesc="Base class with serialization helpers for user-defined Python objects"
arch=('any')
url="https://pypi.org/project/serializable"
license=('Apache')
depends=('python-simplejson' 'python-six' 'python-typechecks')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('ec604e5df0c1236c06d190043a407495c4412dd6b6fd3b45a8514518173ed961')

build(){
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
