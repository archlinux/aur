# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=python-sparkpost
_pkg="${pkgname#python-}"
pkgver=1.3.10
pkgrel=1
pkgdesc="SparkPost client library for Python"
license=('Apache')
arch=('any')
url="https://github.com/SparkPost/python-sparkpost"
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'exclude_tests.patch')
sha256sums=('a151261d514923e2d3055d122bba86c4d2c7c806419ae1c10ba689cacc3aa3a3'
            'c7003c7e6c29c91a0d0a643a798fd28617bf6cdafc7dc1e7466a548189c45831')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < exclude_tests.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
