# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Stegeman <mstegeman@mozilla.com>

pkgname=python-singleton-decorator
_pkg="${pkgname#python-}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Testable decorator for creating singleton objects"
arch=('any')
url="https://pypi.org/project/$_pkg"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1a90ad8a8a738be591c9c167fdd677c5d4a43d1bc6b1c128227be1c5e03bee07')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
