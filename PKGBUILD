# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=python-serverfiles
_pkg="${pkgname#python-}"
pkgver=0.3.1
pkgrel=2
pkgdesc="Access files on a HTTP server and stores them locally for reuse"
arch=('any')
url="https://github.com/biolab/serverfiles"
license=('GPL')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('5e10fc32e758791e3735bc08bce2ed4702a83b1e45ab96c5d59cc8aeecfbebe1')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	python -m unittest discover
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
